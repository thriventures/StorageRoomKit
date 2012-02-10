//
//  SRObject.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/9/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SRMappableObject.h"

/**
 * Abstract superclass for all StorageRoom Resources.
 *
 */
@interface SRObject : NSObject <SRMappableObject> {
    NSString *mType;
}

/**
 * The type of the resource, mapped from "type/m_type"
 */
@property (nonatomic, copy) NSString *mType;

#pragma mark -
#pragma mark Class Methods

/**
 * The attribute names for this class including the names of all superclasses.
 */
+ (NSArray *)attributeNames;

/**
 * The meta data attribute names for this class including the names of all superclasses. 
 *
 * Meta data attributes are the attributes that can only be read through the API and that contain a special prefix ("@" is the default but
 * for StorageRoomKit this is changed to "m_" to prevent KVC problems).
 */
+ (NSArray *)metaDataNames;

/**
 * The relationships in a dictionary, where the key is the name of the relationship and the value the class that will be used.
 */
+ (NSMutableDictionary *)relationships;

/**
 * The relationship names for this class including the names of all superclasses.
 */
+ (NSArray *)relationshipNames;

/**
 * The names of all attributes, metaData and relationships.
 */
+ (NSArray *)propertyNames;

#pragma mark -
#pragma mark Instance Methods

/**
 * A dictionary with all attribute values by name
 */
- (NSDictionary *)attributes;

/**
 * A dictionary with all meta data attribute values by name
 */
- (NSDictionary *)metaData;

/**
 * A dictionary with all relationship values by name
 */
- (NSDictionary *)relationships;

/**
 * A dictionary with attribute, metaData and relationships by name.
 */
- (NSDictionary *)properties;

/**
 * Set properties with a dictionary.
 */
- (void)setProperties:(NSDictionary *)anDictionary;


@end
