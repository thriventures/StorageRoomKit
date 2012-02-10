//
//  SREntry.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SREntry.h"

#import "SRObject+Private.h"
#import "SREntry+Private.h"


@implementation SREntry

+ (NSString *)objectKeyPath {
    return @"entry";
}

+ (NSMutableDictionary *)collections {
    static NSMutableDictionary *collections = nil;
  
    if (!collections) {
        collections = [[NSMutableDictionary alloc] init];
    }
  
    return collections;
}

+ (SRCollection *)collection {
    return [[self collections] objectForKey:NSStringFromClass([self class])];
}

+ (void)setCollection:(SRCollection *)aCollection {
    [[self collections] setObject:aCollection forKey:NSStringFromClass([self class])];
}


@end
