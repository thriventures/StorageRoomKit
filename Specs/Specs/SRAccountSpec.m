#import "Kiwi.h"

#import "SRAccount.h"

SPEC_BEGIN(SRAccountSpec)

describe(@"Methods", ^{
    __block SRAccount *account = nil;
    
    beforeEach(^{ 
        account = [SRAccount new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[account should] beKindOfClass:[SRModel class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRAccount propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[account should] respondToSelector:selector];
            }
        });
    });
    
    describe(@"objectKeyPath", ^{
        it(@"should be set", ^{
            [[[SRAccount objectKeyPath] should] equal:@"account"]; 
        });
    });
    
    
});

SPEC_END