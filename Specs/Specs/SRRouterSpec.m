#import "Kiwi.h"
#import "SRRouter.h"

#import "SRCollection.h"
#import "SREntry.h"
#import "SREntryProtocol.h"

@interface SRComment : NSObject <SREntry>

@end

@implementation SRComment

+ (RKObjectMapping *)objectMapping {
    return [RKObjectMapping new];
}

+ (NSString *)entryType {
    return @"Post";
}

- (NSString *)mUrl {
    return @"http://api.storageroomapp.com/accounts/456/collections/123/entries/888";
}

- (NSString *)mCollectionUrl {
    return @"http://api.storageroomapp.com/accounts/456/collections/123";
}

@end


SPEC_BEGIN(SRRouterSpec)

__block SRRouter *router = nil;

    beforeEach(^{ 
        router = [SRRouter new];
    });

    describe(@"resourcePathForObject:method:", ^{
        describe(@"SRCollection", ^{
            it(@"should return path for POST", ^{
                [[[router resourcePathForObject:[SRCollection new] method:RKRequestMethodPOST] should] equal:@"/collections"];
            });            
            
            it(@"should return path for other", ^{
                SRCollection *collection = [SRCollection new];
                collection.mUrl = @"http://api.storageroomapp.com/accounts/456/collections/123";
                
                [[[router resourcePathForObject:collection method:RKRequestMethodGET] should] equal:@"/collections/123"];
                [[[router resourcePathForObject:collection method:RKRequestMethodPUT] should] equal:@"/collections/123"];
                [[[router resourcePathForObject:collection method:RKRequestMethodDELETE] should] equal:@"/collections/123"];                
            });                        
        });
        
        describe(@"SREntry", ^{
            it(@"should return path for POST", ^{
                [[[router resourcePathForObject:[SRComment new] method:RKRequestMethodPOST] should] equal:@"/collections/123/entries"];
            });            
            
            it(@"should return path for other", ^{
                SRComment *post = [SRComment new];
                
                [[[router resourcePathForObject:post method:RKRequestMethodGET] should] equal:@"/collections/123/entries/888"];
                [[[router resourcePathForObject:post method:RKRequestMethodPUT] should] equal:@"/collections/123/entries/888"];
                [[[router resourcePathForObject:post method:RKRequestMethodDELETE] should] equal:@"/collections/123/entries/888"];                
            });                        
        });
        
        describe(@"Unknown", ^{
            it(@"should call superclass", ^{
                [[theBlock(^{
                    [router resourcePathForObject:[NSObject new] method:RKRequestMethodPOST]; 
                }) should] raise];
            });
        });

    });

SPEC_END