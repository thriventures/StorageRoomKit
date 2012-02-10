//
//  SRAccount.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRModel.h"

/**
 * Class for Account Resources
 */
@interface SRAccount : SRModel {
    NSString *name;
    NSString *subdomain;
    NSString *mCollectionsUrl;
    NSString *mDeletedEntriesUrl;
}

/**
 * The name of the Account.
 */
@property (nonatomic, copy) NSString *name;

/**
 * The subdomain of the Account.
 */
@property (nonatomic, copy) NSString *subdomain;

/**
 * The URL to a Resource with an SRArray of all Collections.
 *
 * @see SRCollection
 */
@property (nonatomic, copy) NSString *mCollectionsUrl;

/**
 * The URL to a Resource with an SRArray of all Deleted Entries.
 *
 * @see SRDeletedEntry
 */
@property (nonatomic, copy) NSString *mDeletedEntriesUrl;


@end
