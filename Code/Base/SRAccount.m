//
//  SRAccount.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRAccount.h"

@implementation SRAccount

@synthesize name, subdomain, mCollectionsUrl, mDeletedEntriesUrl;

+ (NSArray *)attributeNames {
    return [[super attributeNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"name", @"subdomain", nil]];
}

+ (NSArray *)metaDataNames {
    return [[super metaDataNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"collections_url", @"deleted_entries_url", nil]];
}

+ (NSString *)objectKeyPath {
    return @"account";
}

- (void)dealloc {
    self.name = nil;
    self.subdomain = nil;
    
    self.mCollectionsUrl = nil;   
    self.mDeletedEntriesUrl = nil;
    
    [super dealloc];
}

@end
