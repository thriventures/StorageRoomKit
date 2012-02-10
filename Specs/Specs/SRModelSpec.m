#import "Kiwi.h"

#import "SRModel.h"

SPEC_BEGIN(SRModelSpec)

describe(@"Methods", ^{
    __block SRModel *model = nil;
    
    beforeEach(^{ 
        model = [SRModel new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[model should] beKindOfClass:[SRResource class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRModel propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[model should] respondToSelector:selector];
            }
        });
    });
    
    describe(@"Methods", ^{

    });
});

SPEC_END