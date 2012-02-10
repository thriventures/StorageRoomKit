//
//  SRLocation.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRLocation.h"


@implementation SRLocation

@synthesize lat, lng;

+ (NSArray *)attributeNames {
    return [[super attributeNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"lat", @"lng", nil]];
}


- (void)dealloc {
    self.lat = nil;
    self.lng = nil;
    
    [super dealloc];
}

@end
