//
//  SRImage.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRImage.h"


@implementation SRImage

@synthesize mUrl, mVersions;

+ (NSArray *)metaDataNames {
    return [[super metaDataNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"url", nil]];
}

- (void)dealloc {
    self.mUrl = nil;
    self.mVersions = nil;
    
    [super dealloc];
}

@end
