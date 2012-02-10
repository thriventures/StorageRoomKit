#import "Kiwi.h"

#import "SRAtomicField.h"

SPEC_BEGIN(SRAtomicFieldSpec)

describe(@"Methods", ^{
    __block SRAtomicField *atomicField = nil;
    
    beforeEach(^{ 
        atomicField = [SRAtomicField new];
    });
    
    describe(@"Configuration", ^{
        it(@"should have superclass", ^{
            [[atomicField should] beKindOfClass:[SRField class]]; 
        });
        
        it(@"should have attributes", ^{            
            for (NSString *attribute in [SRAtomicField propertyNames]) {
                SEL selector = NSSelectorFromString(attribute);
                [[atomicField should] respondToSelector:selector];
            }
        });
    });
    
    
});

SPEC_END