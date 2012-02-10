#import "Kiwi.h"

#import "SRImage.h"

SPEC_BEGIN(SRImageSpec)

describe(@"Methods", ^{
    __block SRImage *image = nil;
    
    beforeEach(^{ 
        image = [SRImage new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[image should] beKindOfClass:[SREmbedded class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRImage propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[image should] respondToSelector:selector];
            }
        });
    });
    
    
});

SPEC_END
