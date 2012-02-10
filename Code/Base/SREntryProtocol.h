//
//  SREntry.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/9/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

@class RKObjectMapping;

/**
 * The protocol that must be implemented by all user-defined Entry classes.
 */
@protocol SREntry <NSObject>

/**
 * The object mapping for the class.
 */
+ (RKObjectMapping *)objectMapping;

/**
 * The entry type of the Collection.
 *
 * @see SRCollection
 */
+ (NSString *)entryType;

@optional

/**
 * The remote URL of the Entry, this is only required when modifying Entries.
 */
- (NSString *)mUrl;

/**
 * The remote URL where new Entries must be posted to, this is only required when creating new Entries.
 */
- (NSString *)mCollectionUrl;

@end
