//
//  SRLocation.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SREmbedded.h"

/**
 * An embedded Location Resource
 */
@interface SRLocation : SREmbedded {
    NSNumber *lat;
    NSNumber *lng;
}

/**
 * The latitude of the Location.
 */
@property (nonatomic, retain) NSNumber *lat;

/**
 * The longitude of the Location.
 */
@property (nonatomic, retain) NSNumber *lng;

@end
