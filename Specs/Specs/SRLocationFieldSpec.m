#import "Kiwi.h"

#import "SRLocationField.h"

SPEC_BEGIN(SRLocationFieldSpec)

describe(@"Methods", ^{
    __block SRLocationField *locationField = nil;
    
    beforeEach(^{ 
        locationField = [SRLocationField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[locationField should] beKindOfClass:[SRCompoundField class]]; 
        });
    });
    
    
});

SPEC_END