#import "Kiwi.h"

#import "SRFloatField.h"

SPEC_BEGIN(SRFloatFieldSpec)

describe(@"Methods", ^{
    __block SRFloatField *floatField = nil;
    
    beforeEach(^{ 
        floatField = [SRFloatField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[floatField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END