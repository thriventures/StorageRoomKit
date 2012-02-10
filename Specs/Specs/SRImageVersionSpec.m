#import "Kiwi.h"

#import "SRImageVersion.h"

SPEC_BEGIN(SRImageVersionSpec)

describe(@"Methods", ^{
    __block SRImageVersion *imageVersion = nil;
    
    beforeEach(^{ 
        imageVersion = [SRImageVersion new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[imageVersion should] beKindOfClass:[SREmbedded class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRImageVersion propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[imageVersion should] respondToSelector:selector];
            }
        });
    });
    
    
});

SPEC_END
