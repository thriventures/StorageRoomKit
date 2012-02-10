//
//  SRModel.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRModel.h"


@implementation SRModel

@synthesize mVersion, mCreatedAt, mUpdatedAt;

+ (NSArray *)metaDataNames {
    return [[super metaDataNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"version", @"created_at", @"updated_at", nil]];
}

- (void)dealloc {
    self.mVersion = nil;
    self.mCreatedAt = nil;
    self.mUpdatedAt = nil;    
    
    [super dealloc];
}




@end
