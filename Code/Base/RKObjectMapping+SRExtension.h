//
//  RKObjectMapping+SRExtension.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//


/**
 * StorageRoomKit additions to RKObjectMapping.
 */
@interface RKObjectMapping (SRExtension)

/**
 * Add multiple attributes with underscored remote names and map them to the local camel-cased name.
 */
- (void)mapSRAttributes:(NSString*)attributeKey, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * Add multiple meta data attributes with underscored remote names (without the meta prefix) and map them to the local camel-cased name (prefixed with "m").
 */
- (void)mapSRMetaData:(NSString*)attributeKey, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * Add multiple relationships with underscored remote names and map them to the local camel-cased name.
 */
- (void)mapSRRelationships:(NSString *)relationshipName, ... NS_REQUIRES_NIL_TERMINATION;

@end
