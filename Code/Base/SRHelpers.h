//
//  Helpers.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#pragma mark -
#pragma mark Path/URL helpers

/**
 * Returns the absolute path to the Account.
 */
NSString *SRAccountPath(NSString *accountId);

/**
 * Returns the relative path to the baseURL of all Collections.
 */
NSString *SRCollectionsPath(void);

/**
 * Returns the relative path to the baseURL of one Collection.
 */
NSString *SRCollectionPath(NSString *collectionId);

/**
 * Returns the relative path to the baseURL of all Entries of a Collection.
 */
NSString *SRCollectionEntriesPath(NSString *collectionId);

/**
 * Returns the relative path to the baseURL of an Entry in a Collection.
 */
NSString *SRCollectionEntryPath(NSString *collectionId, NSString *entryId);

/**
 * Returns the relative path to the baseURL of all Deleted Entries.
 */
NSString *SRDeletedEntriesPath(void);

/**
 * Returns the relative path to the baseURL of all Deleted Entries for a specific Collection.
 */
NSString *SRDeletedEntriesForCollection(NSString *collectionUrl);

/**
 * Transform an absolute URL to a path relative to the baseURL.
 */
NSString *SRAbsoluteUrlToRelativePath(NSString *absoluteURL);

/**
 * Append query parameters to a query string but check for an existing query string.
 */
NSString *SRPathAppendQueryParams(NSString *resourcePath, NSDictionary *queryParams);




#pragma mark -
#pragma mark Other helpers

/**
 * Return the metafied version of a string (prepend "m_").
 */
NSString *SRMeta(NSString *aName);

/**
 * Returns the string with an added operator.
 */
NSString *SRAppendOperator(NSString *base, NSString *op);

/**
 * The identifier of the attribute that contains the type information.
 */
NSString *SRTypeAttribute(void);


/**
 * Transform an identifier with underscores to a camel-cased Objective-C name.
 */
NSString *SRIdentifierToObjectiveC(NSString *aName);

/**
 * Transform a camel-cased Objective-C name to an identifier with underscores.
 */
NSString *SRObjectiveCToIdentifier(NSString *aName);

/**
 * Returns the ID of a Model URL.
 */
NSString *SRIdFromUrl(NSString *aUrl);

/**
 * Returns all subclasses of a given class.
 */
NSArray  *SRSubclasses(Class aClass);
