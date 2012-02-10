//
//  SRImageVersion.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SREmbedded.h"

/**
 * Definition for one image version
 */
@interface SRImageVersion : SREmbedded {
    NSString *identifier;
    NSString *format;
    NSString *resizeMode;
    NSNumber *width;
    NSNumber *height;
    NSNumber *scale;
}

/**
 * The identifier of the image version in the API
 */
@property (nonatomic, copy) NSString *identifier;

/**
 * The file format of the auto-generated image.
 */
@property (nonatomic, copy) NSString *format;

/**
 * The resize mode of the auto-generated image.
 */
@property (nonatomic, copy) NSString *resizeMode;

/**
 * The width of the auto-generated image.
 */
@property (nonatomic, retain) NSNumber *width;

/**
 * The height of the auto-generated image.
 */
@property (nonatomic, retain) NSNumber *height;

/**
 * The scale of the auto-generated image when the resizeMode is relative.
 */
@property (nonatomic, retain) NSNumber *scale;

@end
