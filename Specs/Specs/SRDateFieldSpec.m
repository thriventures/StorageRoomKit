#import "Kiwi.h"

#import "SRDateField.h"

SPEC_BEGIN(SRDateFieldSpec)

describe(@"Methods", ^{
    __block SRDateField *dateField = nil;
    
    beforeEach(^{ 
        dateField = [SRDateField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[dateField should] beKindOfClass:[SRAtomicField class]]; 
        });
    });
    
    
});

SPEC_END