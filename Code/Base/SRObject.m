//
//  SRObject.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/9/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRObject.h"

#import "SRObject+Private.h"
#import "SREntryMappingDelegate.h"

//#import "RKObjectMapping.h"
//#import "RKDynamicObjectMapping.h"
#import "SRModel.h"
#import "SREntry.h"
#import "SREmbedded.h"
#import "SRHelpers.h"
//#import "RKLog.h"

//#undef RKLogComponent
//#define RKLogComponent lcl_cStorageRoomKitObjectMapping


@implementation SRObject

@synthesize mType;

#pragma mark - 
#pragma mark SRMappable Protocol

+ (NSObject<RKObjectMappingDefinition> *)objectMapping { 
    if ([self isCustomMapping]) {
        return [self customMapping];
    }
    else {
        return [self concreteMapping];
    }
}

+ (RKObjectMapping *)inverseObjectMapping {
    NSObject<RKObjectMappingDefinition> *mapping = [self objectMapping];
    
    if ([self hasInverseObjectMapping] && [mapping isKindOfClass:[RKObjectMapping class]]) {
        return [(RKObjectMapping *)mapping inverseMapping];
    }
    else {
        return nil;
    }
}

+ (NSString *)objectType {
    NSString *className = NSStringFromClass(self);
    NSUInteger length = [className length];
    NSRange range = NSMakeRange(2, length - 2);
    
    return [className substringWithRange:range];
}

+ (NSString *)objectKeyPath {
    return nil;
}

+ (BOOL)isCustomMapping {
    return  self == [SRModel class] ||
            self == [SREntry class] ||
            self == [SREmbedded class];
}

+ (BOOL)hasInverseObjectMapping {
    return [[self attributeNames] count];
}

#pragma mark -
#pragma mark Attribute Helper Methods

+ (NSArray *)propertyNames {
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSString *attributeName in [self attributeNames]) {
        [array addObject:SRIdentifierToObjectiveC(attributeName)];
    }
    
    for (NSString *metaDataName in [self metaDataNames]) {
        [array addObject:SRIdentifierToObjectiveC(SRMeta(metaDataName))];
    }
    
    for (NSString *relationshipName in [self relationshipNames]) {
        [array addObject:SRIdentifierToObjectiveC(relationshipName)];
    }
    
    return array;
}

+ (NSArray *)attributeNames {
    return [NSArray array];
}

+ (NSArray *)metaDataNames {
    return [NSArray arrayWithObject:@"type"];    
}

+ (NSArray *)relationshipNames {
    return [[self relationships] allKeys];    
}

+ (NSMutableDictionary *)relationships {
    return [NSMutableDictionary dictionary];
}

#pragma mark -
#pragma mark Mapping Helper Methods


+ (NSObject<RKObjectMappingDefinition> *)customMapping {
    static SREntryMappingDelegate *delegate = nil;
    
    if (!delegate) {
        delegate = [[SREntryMappingDelegate alloc] init];
    }
    
    RKDynamicObjectMapping *mapping = (RKDynamicObjectMapping *)[self dynamicMapping];
    mapping.delegate = delegate;
    
    return mapping;
}

+ (RKDynamicObjectMapping *)dynamicMapping {
    RKDynamicObjectMapping *dynamicMapping = [RKDynamicObjectMapping dynamicMapping];
    NSString *keyPath = SRTypeAttribute();
    
    RKLogDebug(@"Creating dynamic mapping for %@", [self objectType]);
    
    for (Class klass in SRSubclasses(self)) {
        NSObject <RKObjectMappingDefinition> *mapping = [klass objectMapping];
        
        if ([mapping isKindOfClass:[RKObjectMapping class]]) {
            RKObjectMapping *objectMapping = (RKObjectMapping *)mapping;
            [dynamicMapping setObjectMapping:objectMapping whenValueOfKeyPath:keyPath isEqualTo:[klass objectType]];
            RKLogTrace(@"Added to dynamic mapping: %@", [klass objectType]);
        }
    }
    
    return dynamicMapping;
}

+ (RKObjectMapping *)concreteMapping {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:self];
    
    RKLogDebug(@"Creating mapping for %@", [self objectType]);
    
    [self addAttributes:[self attributeNames] toObjectMapping:objectMapping];
    [self addMetaData:[self metaDataNames] toObjectMapping:objectMapping];
    [self addRelationships:[self relationships] toObjectMapping:objectMapping];
    
    return objectMapping;
}


#pragma mark -
#pragma mark Attribute To Mapping Helper Methods

+ (void)addAttributes:(NSArray *)anArray toObjectMapping:(RKObjectMapping *)anObjectMapping {
    for (NSString *attributeName in anArray) {
        [self addAttributeWithName:attributeName toObjectMapping:anObjectMapping];
    }
}

+ (void)addMetaData:(NSArray *)anArray toObjectMapping:(RKObjectMapping *)anObjectMapping {
    for (NSString *metaDataName in anArray) {
        [self addMetaDataWithName:metaDataName toObjectMapping:anObjectMapping];
    }
}

+ (void)addRelationships:(NSDictionary *)aDictionary toObjectMapping:(RKObjectMapping *)anObjectMapping {
    for (NSString *relationshipName in aDictionary) {
        Class class = [aDictionary objectForKey:relationshipName];
        [self addRelationshipWithName:relationshipName relationshipMapping:[class objectMapping] toObjectMapping:anObjectMapping];
    } 
}

+ (void)addAttributeWithName:(NSString *)aName toObjectMapping:(RKObjectMapping *)anObjectMapping {
    RKObjectAttributeMapping *attributeMapping = [RKObjectAttributeMapping mappingFromKeyPath:aName toKeyPath:SRIdentifierToObjectiveC(aName)];
    [anObjectMapping addAttributeMapping:attributeMapping];
}

+ (void)addMetaDataWithName:(NSString *)aName toObjectMapping:(RKObjectMapping *)anObjectMapping {
    NSString *metaKey = SRMeta(aName);
    RKObjectAttributeMapping *attributeMapping = [RKObjectAttributeMapping mappingFromKeyPath:metaKey toKeyPath:SRIdentifierToObjectiveC(metaKey)];
    [anObjectMapping addAttributeMapping:attributeMapping];
}

+ (void)addRelationshipWithName:(NSString *)aName relationshipMapping:(NSObject <RKObjectMappingDefinition> *)aRelationshipMapping toObjectMapping:(RKObjectMapping *)anObjectMapping {
    RKObjectRelationshipMapping *relationshipMapping = [RKObjectRelationshipMapping mappingFromKeyPath:aName toKeyPath:SRIdentifierToObjectiveC(aName) withMapping:aRelationshipMapping];
    [anObjectMapping addAttributeMapping:relationshipMapping];
}

#pragma mark -
#pragma mark NSObject

- (void)dealloc {
    self.mType = nil;    
    
    [super dealloc];
}

#pragma mark -
#pragma mark Instance Methods

- (NSDictionary *)attributes {
    return [self dictionaryWithValuesForKeys:[[self class] attributeNames]];
}

- (NSDictionary *)metaData {
    return [self dictionaryWithValuesForKeys:[[self class] metaDataNames]];    
}

- (NSDictionary *)relationships {
    return [self dictionaryWithValuesForKeys:[[self class] relationshipNames]];
}

- (NSDictionary *)properties {
    return [self dictionaryWithValuesForKeys:[[self class] propertyNames]];
}

- (void)setProperties:(NSDictionary *)anDictionary {
    [self setValuesForKeysWithDictionary:anDictionary];
}




@end
