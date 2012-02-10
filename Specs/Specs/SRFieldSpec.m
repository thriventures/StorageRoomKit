#import "Kiwi.h"

#import "SRField.h"

SPEC_BEGIN(SRFieldSpec)

describe(@"Methods", ^{
    __block SRField *field = nil;
    
    beforeEach(^{ 
        field = [SRField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[field should] beKindOfClass:[SREmbedded class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRField  propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[field should] respondToSelector:selector];
            }
        });
    });
    
    
});

SPEC_END
