#import "Kiwi.h"
#import "SRObjectMappingProvider.h"

#import "SRCollection.h"
#import "SREntry.h"
#import "SRObjectManager.h"
#import "SREntryProtocol.h"
#import "RKObjectMapping+SRExtension.h"

@interface SRArticle : NSObject <SREntry>

@end

@implementation SRArticle

+ (RKObjectMapping *)objectMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];
    
    [mapping mapSRAttributes:@"attribute_one", nil];
    
    return mapping;
}

+ (NSString *)entryType {
    return @"Article";
}

- (NSString *)mUrl {
    return @"http://api.storageroomapp.com/accounts/456/collections/123/entries/888";
}

- (NSString *)mCollectionUrl {
    return @"http://api.storageroomapp.com/accounts/456/collections/123";
}

@end


SPEC_BEGIN(SRObjectMappingProviderSpec)

__block SRObjectManager *objectManager = nil;

beforeEach(^{ 
    objectManager = [[SRObjectManager alloc] initWithAccountId:@"ACCOUNT_ID" authenticationToken:@"TOKEN" ssl:NO host:@"api.storageroomapp.com"];

});

describe(@"serializationMappingForClass:", ^{
    it(@"should return mapping for Entry class", ^{
        RKObjectMapping *mapping = [objectManager.mappingProvider serializationMappingForClass:[SRArticle class]];
        
        [[[SRObjectManager entryObjectMappings] objectForKey:@"Article"] shouldNotBeNil];
        
        [[mapping.rootKeyPath should] equal:@"entry"];
        RKObjectAttributeMapping *attributeMapping = [[mapping attributeMappings] objectAtIndex:0];
        [[attributeMapping.sourceKeyPath should] equal:@"attributeOne"];
        [[attributeMapping.destinationKeyPath should] equal:@"attribute_one"];
    });
    
    it(@"should return mapping for internal class", ^{
        RKObjectMapping *mapping = [objectManager.mappingProvider serializationMappingForClass:[SRCollection class]];
                
        [[mapping.rootKeyPath should] equal:@"collection"];
        RKObjectAttributeMapping *attributeMapping = [[mapping attributeMappings] objectAtIndex:0];
        [[attributeMapping.sourceKeyPath should] equal:@"name"];
        [[attributeMapping.destinationKeyPath should] equal:@"name"];
    });
});

SPEC_END