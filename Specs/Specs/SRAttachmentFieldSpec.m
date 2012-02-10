#import "Kiwi.h"

#import "SRAttachmentField.h"

SPEC_BEGIN(SRAttachmentFieldSpec)

describe(@"Methods", ^{
    __block SRAttachmentField *attachmentField = nil;
    
    beforeEach(^{ 
        attachmentField = [SRAttachmentField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[attachmentField should] beKindOfClass:[SRCompoundField class]]; 
        });
    });
    
    
});

SPEC_END