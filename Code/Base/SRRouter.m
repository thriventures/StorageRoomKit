//
//  SRRouter.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/10/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRRouter.h"

#import "SRCollection.h"
#import "SREntryProtocol.h"
#import "SRHelpers.h"


@implementation SRRouter

#pragma mark -
#pragma mark Helpers

- (NSString *)resourcePathForObject:(NSObject *)anObject prefix:(NSString *)aPrefix method:(RKRequestMethod)aMethod {
    if (aMethod == RKRequestMethodPOST) {
        return aPrefix;
    }
    else {
        NSString *identifier = SRIdFromUrl([anObject performSelector:@selector(mUrl)]);
        return [NSString stringWithFormat:@"%@/%@", aPrefix, identifier];        
    }
}

#pragma mark -
#pragma mark RKRouter Protocol

- (NSString *)resourcePathForObject:(NSObject *)anObject method:(RKRequestMethod)aMethod {
    if ([anObject isKindOfClass:[SRCollection class]]) {        
        return [self resourcePathForObject:anObject prefix:SRCollectionsPath() method:aMethod];
    }
    else if ([anObject conformsToProtocol:NSProtocolFromString(@"SREntry")]) {
        NSAssert([anObject respondsToSelector:@selector(mUrl)], @"Object must respond to mUrl when generating URLs");
        NSAssert([anObject respondsToSelector:@selector(mCollectionUrl)], @"Object must respond to mCollectionUrl when generating URLs");        
        
        NSObject <SREntry> *entry = (NSObject <SREntry> *)anObject;
        
        NSString *collectionId = SRIdFromUrl([entry mCollectionUrl]);
        
        return [self resourcePathForObject:anObject prefix:SRCollectionEntriesPath(collectionId) method:aMethod];        
    }
    else {
        return [super resourcePathForObject:anObject method:aMethod];
    }
}

@end