//
//  SREntryMappingDelegate.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/9/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

//#import "RKDynamicObjectMapping.h"

/**
 * Returns the appropriate RKObjectMapping for a StorageRoom Resource based on the "@type" attribute.
 *
 * @see SRObjectManager
 */
@interface SREntryMappingDelegate : NSObject <RKDynamicObjectMappingDelegate>


@end
