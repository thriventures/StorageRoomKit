#import "Kiwi.h"

#import "SRArrayField.h"

SPEC_BEGIN(SRArrayFieldSpec)

describe(@"Methods", ^{
    __block SRArrayField *arrayField = nil;
    
    beforeEach(^{ 
        arrayField = [SRArrayField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[arrayField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END