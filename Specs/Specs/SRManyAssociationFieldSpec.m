#import "Kiwi.h"


#import "SRManyAssociationField.h"

SPEC_BEGIN(SRManyAssociationFieldSpec)

describe(@"Methods", ^{
    __block SRManyAssociationField *manyAssociationField = nil;
    
    beforeEach(^{ 
        manyAssociationField = [SRManyAssociationField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[manyAssociationField should] beKindOfClass:[SRAssociationField class]]; 
        });
    });
    
    
});

SPEC_END