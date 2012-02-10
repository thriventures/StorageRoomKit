#import "Kiwi.h"

#import "SREmbedded.h"

SPEC_BEGIN(SREmbeddedSpec)

describe(@"Methods", ^{
    __block SREmbedded *embedded = nil;
    
    beforeEach(^{ 
        embedded = [SREmbedded new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[embedded should] beKindOfClass:[NSObject class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SREmbedded propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[embedded should] respondToSelector:selector];
            }
        });
    });
    
    describe(@"objectKeyPath", ^{
        it(@"should be set", ^{
            [[SREmbedded objectKeyPath] shouldBeNil];
        });
    });
    
});

SPEC_END
