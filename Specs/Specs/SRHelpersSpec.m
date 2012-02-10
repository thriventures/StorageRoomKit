#import "Kiwi.h"

#import "SREntryProtocol.h"

#import "SRCollection.h"
#import "SREntry.h"
#import "SRField.h"
#import "SRAccount.h"
#import "SRHelpers.h"

SPEC_BEGIN(StorageRoomSpec)

describe(@"Helpers", ^{
    describe(@"SRAccountPath()", ^{
        it(@"should return path", ^{
            [[SRAccountPath(@"123") should] equal:@"/accounts/123"];
        });
    });
    
    
    describe(@"SRCollectionsPath()", ^{
        it(@"should return path", ^{
            [[SRCollectionsPath() should] equal:@"/collections"];
        });
    });
    
    
    describe(@"SRCollectionPath()", ^{
        it(@"should return path", ^{
            [[SRCollectionPath(@"123") should] equal:@"/collections/123"];
        });
    });
    
    describe(@"SRCollectionEntriesPath()", ^{
        it(@"should return path", ^{
            [[SRCollectionEntriesPath(@"123") should] equal:@"/collections/123/entries"];
        });
    });
    
    describe(@"SRCollectionEntryPath()", ^{
        it(@"should return path", ^{
            [[SRCollectionEntryPath(@"123", @"456") should] equal:@"/collections/123/entries/456"];
        });
    });
    
    describe(@"SRDeletedEntriesPath()", ^{
        it(@"should return path", ^{
            [[SRDeletedEntriesPath() should] equal:@"/deleted_entries"];
        });
    });
    
    describe(@"SRDeletedEntriesForCollection()", ^{
        it(@"should return path", ^{
            [[SRDeletedEntriesForCollection(@"COLLECTION_URL") should] equal:@"/deleted_entries?collection_url=COLLECTION_URL"];
        });
    });
    
    describe(@"SRAbsoluteUrlToRelativePath()", ^{
        it(@"should return path", ^{
            [[SRAbsoluteUrlToRelativePath(@"http://api.storageroomapp.com/accounts/123/collections/456") should] equal:@"/collections/456"]; 
        });
    });
    
    describe(@"SRMeta()", ^{
        it(@"should return path", ^{
            [[SRMeta(@"something") should] equal:@"m_something"];
        });
    });
    
    describe(@"SRAppendOperator()", ^{
        it(@"should return path", ^{
            [[SRAppendOperator(@"key", @"operator") should] equal:@"key!operator"];
        });
    });
    
    describe(@"SRTypeAttribute()", ^{
        it(@"should return path", ^{
            [[SRTypeAttribute() should] equal:@"m_type"];
        });        
    });
    
    describe(@"SRSubclasses()", ^{
        it(@"should return array", ^{
            NSArray *classes = SRSubclasses([SRObject class]);
            [[classes should] haveCountOf:34];
            [[classes should] contain:[SRAccount class]];
            [[classes should] contain:[SRField class]];
 
        });
    });
    
    describe(@"SRObjectiveCToIdentifier()", ^{
        it(@"should return name", ^{
            [[SRObjectiveCToIdentifier(@"nameInCamelCase") should] equal:@"name_in_camel_case"];            
        });
    });
    
    describe(@"SRIdentifierToObjectiveC()", ^{
        it(@"should return name", ^{
            [[SRIdentifierToObjectiveC(@"name_with_underscores") should] equal:@"nameWithUnderscores"];
        });
    });
    
    describe(@"SRIdFromUrl()", ^{
        it(@"should return id", ^{
            [[SRIdFromUrl(@"http://api.storageroomapp.com/accounts/123/collections/456") should] equal:@"456"];
        });
    });
    
    describe(@"SRPathAppendQueryParams()", ^{
        it(@"should return with existing query", ^{
            [[SRPathAppendQueryParams(@"/existing?one=1&two=2", [NSDictionary dictionaryWithObject:@"3" forKey:@"three"]) should] equal:@"/existing?one=1&two=2&three=3"]; 
        });
        
        it(@"should return without existing query", ^{
            [[SRPathAppendQueryParams(@"/existing", [NSDictionary dictionaryWithObject:@"3" forKey:@"three"]) should] equal:@"/existing?three=3"]; 
        });
    });

});

SPEC_END
