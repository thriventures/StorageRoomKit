#import "Kiwi.h"

#import "SRJsonField.h"

SPEC_BEGIN(SRJsonFieldSpec)

describe(@"Methods", ^{
    __block SRJsonField *jsonField = nil;
    
    beforeEach(^{ 
        jsonField = [SRJsonField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[jsonField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END