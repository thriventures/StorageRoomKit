#import "Kiwi.h"

#import "SRDeletedEntry.h"
#import "SREntry.h"

SPEC_BEGIN(SRDeletedEntrySpec)

describe(@"Methods", ^{
    __block SRDeletedEntry *deletedEntry = nil;
    
    beforeEach(^{ 
        deletedEntry = [SRDeletedEntry new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[deletedEntry should] beKindOfClass:[SRModel class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SREntry propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[deletedEntry should] respondToSelector:selector];
            }
        });
    });
    
    describe(@"objectKeyPath", ^{
        it(@"should be set", ^{
            [[[SRDeletedEntry objectKeyPath] should] equal:@"deleted_entry"]; 
        });
    });
    
    
});

SPEC_END