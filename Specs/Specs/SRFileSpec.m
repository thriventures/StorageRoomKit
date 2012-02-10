#import "Kiwi.h"

#import "SRFile.h"

SPEC_BEGIN(SRFileSpec)

describe(@"Methods", ^{
    __block SRFile *file = nil;
    
    beforeEach(^{ 
        file = [SRFile new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[file should] beKindOfClass:[SREmbedded class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRFile propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[file should] respondToSelector:selector];
            }
        });
    });
    
    
});

SPEC_END
