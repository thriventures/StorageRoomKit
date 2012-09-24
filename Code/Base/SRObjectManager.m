//
//  SRObjectManager.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/11/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRObjectManager.h"

#import "SRObjectManager+Private.h"

#import "objc/runtime.h"
#import "SRMappableObject.h"

#import "NSString+InflectionSupport.h"

#import <RestKit/RKErrorMessage.h>
#import "SREntryProtocol.h"
#import "SRRouter.h"
#import "SRObjectMappingProvider.h"
#import "SRHelpers.h"


#define kCurrentVersion @"0.2.0"

static NSString *metaPrefix = @"m_";
static NSString *defaultHost = @"api.storageroomapp.com";

@implementation SRObjectManager

#pragma mark - 
#pragma mark Class Methods

+ (void)addEntryObjectMapping:(RKObjectMapping *)aMapping forType:(NSString *)aType { 
    [(NSMutableDictionary *)[self entryObjectMappings] setValue:aMapping forKey:aType];
}

+ (void)removeEntryObjectMappingForType:(NSString *)aType {
    [(NSMutableDictionary *)[self entryObjectMappings] removeObjectForKey:aType];
}

+ (NSDictionary *)entryObjectMappings {
    static NSMutableDictionary *entryObjectMappings = nil;
    
    if (!entryObjectMappings) {
        entryObjectMappings = [[NSMutableDictionary alloc] init];
    }
    
    return entryObjectMappings;
}

+ (void)clearEntryObjectMappings {
    [(NSMutableDictionary *)[self entryObjectMappings] removeAllObjects];
}

+ (NSArray *)mappableEntryClasses {
	NSMutableArray *array = [NSMutableArray array];
    int numClasses = objc_getClassList(NULL, 0);
    if (numClasses > 0) {
        Class *classes = malloc(sizeof(Class) * numClasses);
        (void) objc_getClassList (classes, numClasses);
        int i;
        for (i = 0; i < numClasses; i++) {
            Class *c = (Class *)classes[i];
            if ([self isMappableEntryClass:(Class)c]) {
                [array addObject:(Class)c];                
            }
        }
        free(classes);
    }
    
	return array;
}


+ (NSArray *)mappableObjectClasses {
	NSMutableArray *array = [NSMutableArray array];
    int numClasses = objc_getClassList(NULL, 0);
    if (numClasses > 0) {
        Class *classes = malloc(sizeof(Class) * numClasses);
        (void) objc_getClassList (classes, numClasses);
        int i;
        for (i = 0; i < numClasses; i++) {
            Class *c = (Class *)classes[i];
            if ([self isMappableObjectClass:(Class)c]) {
                [array addObject:(Class)c];                
            }
        }
        free(classes);
    }
    
	return array;
}


+ (BOOL)isMappableEntryClass:(Class)class {
	while (class) {
		if (class_conformsToProtocol(class, NSProtocolFromString(@"SREntry"))) {
			return YES;
		}
		class = class_getSuperclass(class);
	}
	return NO;
}

+ (BOOL)isMappableObjectClass:(Class)class {
	while (class) {
		if (class_conformsToProtocol(class, NSProtocolFromString(@"SRMappableObject"))) {
			return YES;
		}
		class = class_getSuperclass(class);
	}
	return NO;
}

+ (BOOL)isNSManagedObjectClass:(Class)class {    
	while (class) {
		if (class == [NSClassFromString(@"NSManagedObject") class]) {
			return YES;
		}
        
		class = class_getSuperclass(class);
	}
	return NO;
}


+ (NSString *)userAgent {
    return [NSString stringWithFormat:@"StorageRoomKit (%@) | powered by RestKit", [[self class] currentVersion]];
}

+ (NSString *)currentVersion {
    return kCurrentVersion;
}

+ (SRObjectManager *)sharedManager {
    return (SRObjectManager *)[super sharedManager];
}

+ (NSString *)metaPrefix {
    return metaPrefix;
}

+ (SRObjectManager *)objectManagerForAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken {
    return [self objectManagerForAccountId:anAccountId authenticationToken:anAuthenticationToken ssl:YES host:defaultHost];
}

+ (SRObjectManager *)objectManagerForAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken ssl:(BOOL)ssl {
    return [self objectManagerForAccountId:anAccountId authenticationToken:anAuthenticationToken ssl:ssl host:defaultHost];
}

+ (SRObjectManager *)objectManagerForAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken ssl:(BOOL)ssl host:(NSString *)aHost {    
    SRObjectManager *manager = [[[self alloc] initWithAccountId:anAccountId authenticationToken:anAuthenticationToken ssl:ssl host:aHost] autorelease];
    
    if (![self sharedManager]) {
		[RKObjectManager setSharedManager:manager];
	}
    
    return manager;
}



#pragma mark - 
#pragma mark NSObject

- (id)initWithAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken ssl:(BOOL)ssl host:(NSString *)aHost {
    NSAssert(anAccountId, @"An Account ID must be passed");
    NSAssert(anAuthenticationToken, @"An Authentication Token must be passed");
    NSAssert(aHost, @"A host must be passed");
    
    RKLogDebug(@"Creating new RKObjectManager for account: %@ token: %@ ssl: %d host: %@", anAccountId, anAuthenticationToken, ssl, aHost);
    
    NSString *protocol = ssl ? @"https" : @"http";
    NSString *baseUrl = [NSString stringWithFormat:@"%@://%@%@", protocol, aHost, SRAccountPath(anAccountId)];
    
    if ((self = [super initWithBaseURL:[NSURL URLWithString:baseUrl]])) {
        self.serializationMIMEType = RKMIMETypeJSON; 
        self.acceptMIMEType = RKMIMETypeJSON;
        
        self.client.username = anAuthenticationToken;
        self.client.password = @"";
        self.client.authenticationType = RKRequestAuthenticationTypeHTTPBasic;
        [self.client setValue:[[self class] metaPrefix] forHTTPHeaderField:@"X-Meta-Prefix"]; // use m_ as meta prefix and not @, as this causes problems with KVC
        [self.client setValue:[[self class] userAgent] forHTTPHeaderField:@"User-Agent"];
        
        self.router = [[[SRRouter alloc] init] autorelease];
        self.mappingProvider = [[[SRObjectMappingProvider alloc] init] autorelease];
        
        [self loadMappableObjects];
        [self loadMappableEntryClassesWithCoreData:NO];
        
        RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
        [errorMapping mapKeyPath:@"message" toAttribute:@"errorMessage"];    
        [self.mappingProvider setMapping:errorMapping forKeyPath:@"error"];
        [self.mappingProvider setMapping:errorMapping forKeyPath:@"errors"];
    }
    
    return self;
}

- (void)dealloc {
    [super dealloc];
}


#pragma mark -
#pragma mark Instance Methods

- (void)loadMappableEntryClassesWithCoreData:(BOOL)withCoreData {
    [SRObjectManager clearEntryObjectMappings];
    
    for (Class <SREntry> class in [[self class] mappableEntryClasses]) {                        
        if (!withCoreData && [[self class] isNSManagedObjectClass:class]) {
            continue;
        }        
        
        NSString *entryType = [class entryType];
        RKObjectMapping *objectMapping = [class objectMapping];
        
        NSAssert(objectMapping, @"objectMapping method must return a mapping");
        NSAssert([entryType length], @"entryType must be present");
        
        RKLogDebug(@"Adding mapping: %@ with entryType: %@ to entryObjectMappings", objectMapping, entryType);                 
        [SRObjectManager addEntryObjectMapping:objectMapping forType:entryType];  
    }
    
}

- (void)loadMappableObjects {         
    for (Class <SRMappableObject> class in [[self class] mappableObjectClasses]) {
        
        NSString *keyPath = [class objectKeyPath];
        
        if (keyPath) {
            RKObjectMappingDefinition *objectMapping = [class objectMapping];  
            
            RKLogDebug(@"Adding mapping: %@ with keyPath: %@ to mappingProvider", objectMapping, keyPath);                
            [self.mappingProvider setMapping:objectMapping forKeyPath:keyPath]; 
            
            RKObjectMapping *inverseMapping = [class inverseObjectMapping];
            
            if (inverseMapping) {
                RKLogDebug(@"Adding reverse mapping: %@ for class: %@", inverseMapping, NSStringFromClass(class));                    
                [self.mappingProvider setSerializationMapping:inverseMapping forClass:class];
            }
        }
    }
}

- (void)setObjectStore:(RKManagedObjectStore *)anObjectStore {
    [super setObjectStore:anObjectStore];
    [self loadMappableEntryClassesWithCoreData:YES];
}

@end
