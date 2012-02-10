#import "Kiwi.h"

#import "SROneAssociationField.h"

SPEC_BEGIN(SROneAssociationFieldSpec)

describe(@"Methods", ^{
    __block SROneAssociationField *oneAssociationField = nil;
    
    beforeEach(^{ 
        oneAssociationField = [SROneAssociationField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[oneAssociationField should] beKindOfClass:[SRAssociationField class]]; 
        });
    });
    
    
});

SPEC_END