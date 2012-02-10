#import "Kiwi.h"

#import "SRFileField.h"

SPEC_BEGIN(SRFileFieldSpec)

describe(@"Methods", ^{
    __block SRFileField *fileField = nil;
    
    beforeEach(^{ 
        fileField = [SRFileField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[fileField should] beKindOfClass:[SRCompoundField class]]; 
        });
    });
    
    
});

SPEC_END