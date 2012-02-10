#import "Kiwi.h"

#import "SRImageField.h"

SPEC_BEGIN(SRImageFieldSpec)

describe(@"Methods", ^{
    __block SRImageField *imageField = nil;
    
    beforeEach(^{ 
        imageField = [SRImageField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[imageField should] beKindOfClass:[SRCompoundField class]]; 
        });
    });
    
    
});

SPEC_END