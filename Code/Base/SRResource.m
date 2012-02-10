//
//  SRResource.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRResource.h"

@implementation SRResource

@synthesize mUrl;

+ (NSArray *)metaDataNames {
    return [[super metaDataNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"url", nil]];
}

- (void)dealloc {
    self.mUrl = nil;    
    
    [super dealloc];
}

@end
