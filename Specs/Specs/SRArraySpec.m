#import "Kiwi.h"


#import "SRArray.h"

SPEC_BEGIN(SRArraySpec)

describe(@"Methods", ^{
    __block SRArray *array = nil;
    
    beforeEach(^{ 
        array = [SRArray new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[array should] beKindOfClass:[SRResource class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRArray propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[array should] respondToSelector:selector];
            }
        });
    });
    
    describe(@"objectKeyPath", ^{
        it(@"should be set", ^{
            [[[SRArray objectKeyPath] should] equal:@"array"]; 
        });
    });
    
    
});

SPEC_END