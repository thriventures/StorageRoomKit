#import "Kiwi.h"

#import "SRIntegerField.h"

SPEC_BEGIN(SRIntegerFieldSpec)

describe(@"Methods", ^{
    __block SRIntegerField *integerField = nil;
    
    beforeEach(^{ 
        integerField = [SRIntegerField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[integerField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END