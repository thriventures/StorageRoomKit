#import "Kiwi.h"

#import "SRTimeField.h"

SPEC_BEGIN(SRTimeFieldSpec)

describe(@"Methods", ^{
    __block SRTimeField *timeField = nil;
    
    beforeEach(^{ 
        timeField = [SRTimeField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[timeField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END