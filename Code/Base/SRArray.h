//
//  SRArray.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRResource.h"

/**
 * Container for many returned results.
 */
@interface SRArray : SRResource {
    NSArray *resources;
    NSNumber *mTotalResources;
    NSNumber *mPages;
    NSNumber *mPage;
    NSNumber *mPerPage;
    NSString *mNextPageUrl;
    NSString *mPreviousPageUrl;
}

/**
 * An array of the Resources that have been returned throught he API.
 */
@property (nonatomic, retain) NSArray *resources;

/**
 * The total number of available Resources (pagination will only provide a limited number of Resources for each request).
 */
@property (nonatomic, retain) NSNumber *mTotalResources;

/**
 * The number of pages that will be required for the current page size to fetch all Resources.
 */
@property (nonatomic, retain) NSNumber *mPages;

/**
 * The current page number.
 */
@property (nonatomic, retain) NSNumber *mPage;

/**
 * The number of Resources that are returned on each page.
 */
@property (nonatomic, retain) NSNumber *mPerPage;

/**
 * The URL to the next page of Resources. This will be nil on the last page.
 */
@property (nonatomic, copy) NSString *mNextPageUrl;

/**
 * The URL to the previous page of Resources. This will be nil on the first page.
 */
@property (nonatomic, copy) NSString *mPreviousPageUrl;

@end
