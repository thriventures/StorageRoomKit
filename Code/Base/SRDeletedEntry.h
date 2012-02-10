//
//  SRDeletedEntry.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/11/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRModel.h"

/**
 * Class for Deleted Entries. A Deleted Entry is created when a regular Entry is deleted from the server.
 * Having this Resource is useful for synchronization.
 */
@interface SRDeletedEntry : SRModel {
    NSString *mCollectionUrl;
    NSString *mEntryUrl;
    NSDate *mDeletedAt;
}

/**
 * The URL to the Collection of the Entry.
 *
 * @see SRCollection
 */
@property (nonatomic, copy) NSString *mCollectionUrl;

/**
 * The original URL to the Entry, use this to find the Entry.
 *
 * @see SREntry
 */
@property (nonatomic, copy) NSString *mEntryUrl;

/**
 * The time at which the Entry was deleted.
 *
 * @see SREntry
 */
@property (nonatomic, retain) NSDate *mDeletedAt;

@end