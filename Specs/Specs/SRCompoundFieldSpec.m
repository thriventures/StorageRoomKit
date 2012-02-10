#import "Kiwi.h"

#import "SRCompoundField.h"

SPEC_BEGIN(SRCompoundFieldSpec)

describe(@"Methods", ^{
    __block SRCompoundField *compoundField = nil;
    
    beforeEach(^{ 
        compoundField = [SRCompoundField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[compoundField should] beKindOfClass:[SRField class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRCompoundField propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[compoundField should] respondToSelector:selector];
            }
        });
    });
    
    
});

SPEC_END