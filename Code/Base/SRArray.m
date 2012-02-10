//
//  SRArray.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRArray.h"

#import "SRModel.h"

@implementation SRArray

@synthesize resources;
@synthesize mTotalResources, mPages, mPage, mPerPage, mNextPageUrl, mPreviousPageUrl;

#pragma mark -
#pragma mark SRObject

+ (NSString *)objectKeyPath {
    return @"array";
}

+ (NSMutableDictionary *)relationships {
    NSMutableDictionary *relationships = [super relationships];
    
    [relationships setObject:[SRModel class] forKey:@"resources"];
    
    return relationships;
}

+ (NSArray *)metaDataNames {
    return [[super metaDataNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"total_resources", @"pages", @"page", @"per_page", @"next_page_url", @"previous_page_url", nil]];
}

#pragma mark -
#pragma mark NSObject

- (void)dealloc {
    self.resources = nil;
    
    self.mTotalResources = nil;
    self.mPages = nil;
    self.mPage = nil;
    self.mPerPage = nil;
    self.mNextPageUrl = nil;
    self.mPreviousPageUrl = nil;
    
    [super dealloc];
}




@end
