#import "Kiwi.h"

#import "SRBooleanField.h"

SPEC_BEGIN(SRBooleanFieldSpec)

describe(@"Methods", ^{
    __block SRBooleanField *booleanField = nil;
    
    beforeEach(^{ 
        booleanField = [SRBooleanField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[booleanField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END