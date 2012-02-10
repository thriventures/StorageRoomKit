#import "Kiwi.h"


#import "SRStringField.h"

SPEC_BEGIN(SRStringFieldSpec)

describe(@"Methods", ^{
    __block SRStringField *stringField = nil;
    
    beforeEach(^{ 
        stringField = [SRStringField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[stringField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END