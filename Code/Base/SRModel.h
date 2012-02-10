//
//  SRModel.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRResource.h"

/**
 * Abstract superclass for Model Resources
 */
@interface SRModel : SRResource {
    NSNumber *mVersion;
    NSDate *mCreatedAt;
    NSDate *mUpdatedAt;
}

/**
 * The current version identifier. This is used for optimistic locking.
 */
@property (nonatomic, retain) NSNumber *mVersion;

/**
 * The time at which the Model was created on the server.
 */
@property (nonatomic, retain) NSDate *mCreatedAt;

/**
 * The time at which the Model was last updated on the server.
 */
@property (nonatomic, retain) NSDate *mUpdatedAt;


@end
