//
//  SRFile.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SREmbedded.h"

/**
 * An uploaded file of any type
 */
@interface SRFile : SREmbedded {
    NSString *mUrl;
}

/**
 * The URL where the actual uploaded file can be downloaded.
 */
@property (nonatomic, copy) NSString *mUrl;

@end
