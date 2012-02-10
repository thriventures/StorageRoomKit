//
//  SRDeletedEntry.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/11/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRDeletedEntry.h"

@implementation SRDeletedEntry

@synthesize mCollectionUrl, mEntryUrl, mDeletedAt;

+ (NSArray *)metaDataNames {
    return [[super metaDataNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"collection_url", @"entry_url", @"deleted_at", nil]];
}

+ (NSString *)objectKeyPath {
    return @"deleted_entry";
}

- (void)dealloc {
    self.mCollectionUrl = nil;
    self.mEntryUrl = nil;
    self.mDeletedAt = nil;
    
    [super dealloc];
}

@end
