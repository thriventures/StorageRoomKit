#import "Kiwi.h"
#import "SRObject.h"

#import "SRObject+Private.h"

#import "SREntry.h"
#import "SRAccount.h"
#import "SRCollection.h"
#import "SREmbedded.h"
#import "SREntryMappingDelegate.h"
#import "SRStringField.h"

SPEC_BEGIN(SRObjectSpec)

describe(@"ClassMethods", ^{
    describe(@"isCustomMapping", ^{
        it(@"should return NO", ^{
            [[theValue([SRObject isCustomMapping]) should] beNo];
        });
        
        it(@"should return YES", ^{
            [[theValue([SREntry isCustomMapping]) should] beYes];
        });        
    });
    
    
    describe(@"objectType", ^{
        it(@"should return type", ^{
            [[[SRObject objectType] should] equal:@"Object"];
            [[[SREntry objectType] should] equal:@"Entry"];
        });
    });

    
    describe(@"attributeNames", ^{
        it(@"should return an array", ^{
            NSArray *objectAttributeNames = [SRObject attributeNames]; 
            [[objectAttributeNames should] beKindOfClass:[NSArray class]];
        });
        
        it(@"should return names", ^{
            NSArray *accountAttributeNames = [SRAccount attributeNames];
            [[accountAttributeNames should] contain:@"name"];
            [[accountAttributeNames should] contain:@"subdomain"];            
        });
    });
    
    describe(@"metaDataNames", ^{
        it(@"should return an array", ^{
            NSArray *metaDataNames = [SRObject metaDataNames]; 
            [[metaDataNames should] beKindOfClass:[NSArray class]];
        });
        
        it(@"should return names", ^{
            NSArray *metaDataNames = [SRAccount metaDataNames];
            [[metaDataNames should] contain:@"url"];
            [[metaDataNames should] contain:@"collections_url"];            
        });
    });
    
    describe(@"relationshipNames", ^{
        it(@"should return an array", ^{
            NSArray *relationshipNames = [SRObject relationshipNames]; 
            [[relationshipNames should] beKindOfClass:[NSArray class]];
        });
        
        it(@"should return names", ^{
            NSArray *relationshipNames = [SRCollection relationshipNames];
            [[relationshipNames should] contain:@"fields"];
        });
    });
    
    describe(@"relationships", ^{
        it(@"should return a dictionary", ^{
            NSDictionary *relationships = [SRObject relationships]; 
            [[relationships should] beKindOfClass:[NSDictionary class]];
        });
        
        it(@"should return relationships", ^{
            Class relationshipDescription = [[SRCollection relationships] objectForKey:@"fields"];
            [[relationshipDescription should] equal:[SREmbedded class]];
        });
    });
    
    describe(@"propertyNames", ^{
        it(@"should return names", ^{
            NSArray *propertyNames = [SRCollection propertyNames];
            [[propertyNames should] contain:@"mUrl"];
            [[propertyNames should] contain:@"fields"];            
            [[propertyNames should] contain:@"name"];                        
        });
    });
    
    describe(@"objectKeyPath", ^{
        it(@"should return nil", ^{
            [[SRObject objectKeyPath] shouldBeNil]; 
        });
        
        it(@"should return path", ^{
            [[[SRCollection objectKeyPath] should] equal:@"collection"]; 
        });
    });
    
    describe(@"isCustomMapping", ^{
        it(@"should return YES", ^{
            [[theValue([SRModel isCustomMapping]) should] beYes];
            [[theValue([SREntry isCustomMapping]) should] beYes];
            [[theValue([SREmbedded isCustomMapping]) should] beYes];            
        });
        
        it(@"should return NO", ^{
            [[theValue([SRCollection isCustomMapping]) should] beNo];
        });
    });


    describe(@"objectMapping", ^{
        it(@"should return an objectMapping", ^{
            RKObjectMapping *mapping = (RKObjectMapping *)[SRCollection objectMapping];
            
            [[[mapping objectClass] should] equal:[SRCollection class]];
            
            NSArray *attributeMappings = [mapping attributeMappings];
            RKObjectAttributeMapping *attributeMapping = [attributeMappings objectAtIndex:0];
            [[[attributeMapping sourceKeyPath] should] equal:@"name"];
            [[[attributeMapping destinationKeyPath] should] equal:@"name"];            
            
            RKObjectAttributeMapping *metaMapping = [attributeMappings lastObject];
            [[[metaMapping sourceKeyPath] should] equal:@"m_entries_url"];
            [[[metaMapping destinationKeyPath] should] equal:@"mEntriesUrl"];            
            
            NSArray *relationshipMappings = [mapping relationshipMappings];
            
            for (RKObjectRelationshipMapping *relationshipMapping in relationshipMappings) {
                NSString *sourceKeyPath = relationshipMapping.sourceKeyPath;
                if ([sourceKeyPath isEqualToString:@"fields"]) {
                    [[[relationshipMapping destinationKeyPath] should] equal:@"fields"];                    
                }
                else if ([sourceKeyPath isEqualToString:@"webhook_definitions"]) {
                    [[[relationshipMapping destinationKeyPath] should] equal:@"webhookDefinitions"];                                        
                }
                
                NSObject <RKObjectMappingDefinition> *destinationMapping = [relationshipMapping mapping];
                [[destinationMapping should] beKindOfClass:[RKDynamicObjectMapping class]];
            }
        });
        
        it(@"should return a dynamic mapping", ^{
            RKObjectDynamicMapping *dynamicMapping = (RKObjectDynamicMapping *)[SREmbedded objectMapping];
            
            NSDictionary *data = [NSDictionary dictionaryWithObject:@"StringField" forKey:@"m_type"];
            
            RKObjectMapping *stringFieldMapping = [dynamicMapping objectMappingForDictionary:data];
            [[[stringFieldMapping objectClass] should] equal:[SRStringField class]];
            
        });
        
        it(@"should return a mapping with delegate", ^{
            RKObjectDynamicMapping *dynamicMapping = (RKObjectDynamicMapping *)[SRModel objectMapping];
            
            [[[dynamicMapping.delegate class] should] equal:[SREntryMappingDelegate class]];
        });
    });
    

    
    
});

SPEC_END
