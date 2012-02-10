#import "Kiwi.h"

#import "SRAssociationField.h"

SPEC_BEGIN(SRAssociationFieldSpec)

describe(@"Methods", ^{
    __block SRAssociationField *associationField = nil;
    
    beforeEach(^{ 
        associationField = [SRAssociationField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[associationField should] beKindOfClass:[SRField class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRAssociationField propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[associationField should] respondToSelector:selector];
            }
        });
    });
    
    
});

SPEC_END