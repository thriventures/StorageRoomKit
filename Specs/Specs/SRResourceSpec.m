#import "Kiwi.h"

#import "SRResource.h"

SPEC_BEGIN(SRResourceSpec)

describe(@"Methods", ^{
    __block SRResource *resource = nil;
    
    beforeEach(^{ 
        resource = [SRResource new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[resource should] beKindOfClass:[NSObject class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRResource propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[resource should] respondToSelector:selector];
            }
        });
    });
    
  
});

SPEC_END
