//
//  SRObjectManager.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/11/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import <RestKit/RestKit.h>

/**
 * An extended version of RKObjectManager that contains custom methods to support the StorageRoom API.
 */
@interface SRObjectManager : RKObjectManager

#pragma mark - 
#pragma mark Class Methods

/**
 * Create and initialize a new object manager with the Account ID and an authentication token.
 */
+ (SRObjectManager *)objectManagerForAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken;

/**
 * Create and initialize a new object manager with the Account ID and an authentication token, enable/disable SSL.
 */
+ (SRObjectManager *)objectManagerForAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken ssl:(BOOL)ssl;

/**
 * Create and initialize a new object manager with the Account ID and an authentication token, enable/disable SSL and change the default host.
 */
+ (SRObjectManager *)objectManagerForAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken ssl:(BOOL)ssl host:(NSString *)aHost;

/**
 * Register an object mapping for an Entry.
 */
+ (void)addEntryObjectMapping:(RKObjectMapping *)aMapping forType:(NSString *)aType;

/**
 * Remove an object mapping for an Entry.
 */
+ (void)removeEntryObjectMappingForType:(NSString *)aType;

/**
 * Clear all registered object mappings.
 */
+ (void)clearEntryObjectMappings;

/**
 * A dictionary of all registered object mappings.
 */
+ (NSDictionary *)entryObjectMappings;

/**
 * The meta prefix that is used instead of the "@" sign to prevent problems with KVC (see http://storageroomapp.com/developers/meta_prefix).
 */
+ (NSString *)metaPrefix; 

/**
 * The shared object manager instance.
 */
+ (SRObjectManager *)sharedManager;

#pragma mark - 
#pragma mark Instance Methods

/**
 * Initialize a new object manager with the Account ID, an authentication token, SSL and a host.
 */
- (id)initWithAccountId:(NSString *)anAccountId authenticationToken:(NSString *)anAuthenticationToken ssl:(BOOL)ssl host:(NSString *)aHost;

/**
 * (Re-)load all Entry classes into the mapping provider.
 */
- (void)loadMappableEntryClassesWithCoreData:(BOOL)withCoreData;




@end
