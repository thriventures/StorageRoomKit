//
//  SRImage.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRFile.h"

/**
 * Image Resource with optional image versions
 */
@interface SRImage : SREmbedded {
    NSString *mUrl;
    NSArray *mVersions;
}

/**
 * The URL where the uploaded image can be downloaded.
 */
@property (nonatomic, copy) NSString *mUrl;

/**
 * URLs of the auto-generated image versions
 *
 * @see SRImageVersion
 */
@property (nonatomic, retain) NSArray *mVersions;

@end
