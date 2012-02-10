#import "Kiwi.h"

#import "SRObjectManager.h"
#import "SRObjectManager+Private.h"

#import "SRObject.h"
#import "SRAccount.h"
#import "SRField.h"
#import "SRCollection.h"
#import "SREntryProtocol.h"
#import "SRRouter.h"
#import "SREntry.h"
#import "SRStringField.h"
#import "SRLocationField.h"
#import "SRObjectMappingProvider.h"


@interface SRTest : NSObject {}
@end

@implementation SRTest
@end

@interface SR : NSObject {}
@end

@implementation SR
@end

@interface SRPost : NSObject <SREntry> 
@end

@implementation SRPost

+ (RKObjectMapping *)objectMapping {
    return [RKObjectMapping new];
}

+ (NSString *)entryType {
    return @"Post";
}

@end


SPEC_BEGIN(SRObjectManagerSpec)


describe(@"addEntryObjectMapping:forType:", ^{
    it(@"should set for type", ^{
        RKObjectMapping *objectMapping = [RKObjectMapping new];
        
        [SRObjectManager addEntryObjectMapping:objectMapping forType:@"Test"];
        [[[[SRObjectManager entryObjectMappings] objectForKey:@"Test"] should] equal:objectMapping];
    });
});

describe(@"removeEntryObjectMappingForType:", ^{
    it(@"remove type", ^{
        [SRObjectManager clearEntryObjectMappings];
        RKObjectMapping *objectMapping = [RKObjectMapping new];
        
        [SRObjectManager addEntryObjectMapping:objectMapping forType:@"Test"];
        [[[[SRObjectManager entryObjectMappings] objectForKey:@"Test"] should] equal:objectMapping];
        
        [SRObjectManager removeEntryObjectMappingForType:@"Test"];
        [[[SRObjectManager entryObjectMappings] should] beEmpty];
    });
});

describe(@"entryObjectMappings", ^{
    it(@"should be a dictionary", ^{
        [[[SRObjectManager entryObjectMappings] should] beKindOfClass:[NSDictionary class]];
    });
});


describe(@"metaPrefix", ^{
    it(@"should return default", ^{
        [[[SRObjectManager metaPrefix] should] equal:@"m_"]; 
    });
});

describe(@"version", ^{
    it(@"should return currentVersion", ^{
        [[SRObjectManager currentVersion] shouldNotBeNil]; 
    });
});

describe(@"objectManagerForAccountId:authenticationToken:ssl:host:", ^{
    it(@"should raise error for no account ID", ^{
        [[theBlock(^{
            [SRObjectManager objectManagerForAccountId:nil authenticationToken:@"token" ssl:YES host:@"host"];
        }) should] raise];
    });
    
    it(@"should raise error for no authentication token", ^{
        [[theBlock(^{
            [SRObjectManager objectManagerForAccountId:@"123" authenticationToken:nil ssl:YES host:@"host"];
        }) should] raise];
    });
    
    it(@"should raise error for no host", ^{
        [[theBlock(^{
            [SRObjectManager objectManagerForAccountId:@"123" authenticationToken:@"token" ssl:YES host:nil];
        }) should] raise];
    });
    
    it(@"should return configured RKObjectManager", ^{
        RKObjectManager *objectManager = [SRObjectManager objectManagerForAccountId:@"123" authenticationToken:@"token" ssl:YES host:@"custom.storageroomapp.com"];
        
        [[[objectManager.client baseURL] should] equal:@"https://custom.storageroomapp.com/accounts/123"];
        [[objectManager.client.username should] equal:@"token"];
        [[objectManager.client.password should] equal:@""];
        
        [[theValue(objectManager.client.authenticationType) should] equal:theValue(RKRequestAuthenticationTypeHTTPBasic)];
        
        [[[[objectManager.client HTTPHeaders] objectForKey:@"X-Meta-Prefix"] should] equal:[SRObjectManager metaPrefix]];
        [[[[objectManager.client HTTPHeaders] objectForKey:@"User-Agent"] should] equal:[SRObjectManager userAgent]];            
        
        [[objectManager.serializationMIMEType should] equal:RKMIMETypeJSON];
        [[objectManager.acceptMIMEType should] equal:RKMIMETypeJSON];
        
        RKObjectMapping *errorMapping = [objectManager.mappingProvider mappingForKeyPath:@"error"];
        RKObjectAttributeMapping *attributeMapping = [[errorMapping attributeMappings] objectAtIndex:0];
        [[attributeMapping.sourceKeyPath should] equal:@"message"];
        [[attributeMapping.destinationKeyPath should] equal:@"errorMessage"];        

        
        [[[objectManager.mappingProvider mappingsByKeyPath] shouldNot] beEmpty];
        [[objectManager.router should] beKindOfClass:[SRRouter class]];
        
        [[[SRObjectManager sharedManager] should] equal:objectManager];
    });
});

describe(@"objectManagerForAccountId:authenticationToken:", ^{
    it(@"should return configured RKObjectManager", ^{
        RKObjectManager *objectManager = [SRObjectManager objectManagerForAccountId:@"123" authenticationToken:@"token"];

        [[[objectManager.client baseURL] should] equal:@"https://api.storageroomapp.com/accounts/123"];
        [[objectManager.client.username should] equal:@"token"];
        [[objectManager.client.password should] equal:@""];
        
        [[theValue(objectManager.client.authenticationType) should] equal:theValue(RKRequestAuthenticationTypeHTTPBasic)];
        
        [[[[objectManager.client HTTPHeaders] objectForKey:@"X-Meta-Prefix"] should] equal:[SRObjectManager metaPrefix]];
        [[[[objectManager.client HTTPHeaders] objectForKey:@"User-Agent"] should] equal:[SRObjectManager userAgent]];            
        
        [[[objectManager.mappingProvider mappingsByKeyPath] shouldNot] beEmpty];
        [[objectManager.router should] beKindOfClass:[SRRouter class]];
    });
});

describe(@"isMappableObjectClass:", ^{
    it(@"should return yes", ^{
        [[theValue([SRObjectManager isMappableObjectClass:[SRAccount class]]) should] beYes];
    });
    
    it(@"should return no", ^{
        [[theValue([SRObjectManager isMappableObjectClass:[NSString class]]) should] beNo];
    });
});

describe(@"isMappableEntryClass:", ^{
    it(@"should return yes", ^{
        [[theValue([SRObjectManager isMappableEntryClass:[SRPost class]]) should] beYes];
    });
    
    it(@"should return no", ^{
        [[theValue([SRObjectManager isMappableEntryClass:[NSString class]]) should] beNo];
    });
});

describe(@"mappableObjectClasses", ^{
    it(@"should return array", ^{
        NSArray *classes = [SRObjectManager mappableObjectClasses];
        
        [[classes should] contain:[SRResource class]];
        [[classes should] contain:[SRModel class]];
        [[classes should] contain:[SRAccount class]];
        [[classes should] contain:[SRCollection class]];
        [[classes should] contain:[SREntry class]];
        [[classes should] contain:[SRStringField class]];
        [[classes should] contain:[SRLocationField class]]; 
    });
});

describe(@"mappableEntryClasses", ^{
    it(@"should return array", ^{
        NSArray *classes = [SRObjectManager mappableEntryClasses];
        
        [[classes should] contain:[SRPost class]];
    });
});


describe(@"loadMappableObjects:", ^{
    it(@"should load mappable objects", ^{
        SRObjectManager *objectManager = [SRObjectManager new];
        objectManager.mappingProvider = [SRObjectMappingProvider new];
        
        [objectManager loadMappableObjects];
        RKObjectMapping *mapping = (RKObjectMapping *)[objectManager.mappingProvider mappingForKeyPath:@"collection"];
        [[[mapping objectClass] should] equal:[SRCollection class]];
        
    });
});


SPEC_END
