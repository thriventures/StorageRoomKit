//
//  SRResource.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRObject.h"

/**
 * Abstract Base class for all Resources that have an own URL
 */
@interface SRResource : SRObject {
    NSString *mUrl;
}

/**
 * The remote URL of the resource, mapped from "@url/m_url"
 */
@property (nonatomic, copy) NSString *mUrl;


@end
