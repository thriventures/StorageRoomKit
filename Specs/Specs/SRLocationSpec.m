#import "Kiwi.h"

#import "SRLocation.h"

SPEC_BEGIN(SRLocationSpec)

describe(@"Methods", ^{
    __block SRLocation *location = nil;
    
    beforeEach(^{ 
        location = [SRLocation new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[location should] beKindOfClass:[SREmbedded class]]; 
        });
    });
    
    it(@"should have attributes", ^{            
        for (NSString *attribute in [SRLocation propertyNames]) {
            SEL selector = NSSelectorFromString(attribute);
            [[location should] respondToSelector:selector];
        }
    });
    
    
});

SPEC_END