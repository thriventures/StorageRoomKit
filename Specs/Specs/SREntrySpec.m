#import "Kiwi.h"

#import "SREntry.h"
#import "SREntry+Private.h"
#import "SRCollection.h"

@interface SREntrySubclass : SREntry {

}
@end

@implementation SREntrySubclass

@end


SPEC_BEGIN(SREntrySpec)

describe(@"Methods", ^{
    __block SREntry *entry = nil;
    
    beforeEach(^{ 
        entry = [SREntry new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[entry should] beKindOfClass:[SRModel class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SREntry propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[entry should] respondToSelector:selector];
            }
        });
    });
    
    describe(@"objectKeyPath", ^{
        it(@"should be set", ^{
            [[[SREntry objectKeyPath] should] equal:@"entry"]; 
        });
    });
    
    describe(@"collection", ^{
        it(@"should write and read", ^{
            [[SREntry collections] removeAllObjects];
            
            SRCollection *collection1 = [[SRCollection new] autorelease];
            SRCollection *collection2 = [[SRCollection new] autorelease];
            
            [SREntry setCollection:collection1];
            [SREntrySubclass setCollection:collection2];
            
            [[[SREntry collection] should] equal:collection1];
            [[[SREntrySubclass collection] should] equal:collection2];      
            
            [[[SREntry collections] should] haveCountOf:2];
            [[[SREntrySubclass collections] should] haveCountOf:2];            
        });
    });
    
    
});

SPEC_END
