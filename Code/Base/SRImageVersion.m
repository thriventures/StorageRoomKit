//
//  SRImageVersion.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRImageVersion.h"


@implementation SRImageVersion

@synthesize identifier, format, resizeMode, width, height, scale;

+ (NSArray *)attributeNames {
    return [[super attributeNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"identifier", @"format", @"resize_mode", @"width", @"height", @"scale", nil]];
}

- (void)dealloc {
    self.identifier = nil;
    self.format = nil;
    self.resizeMode = nil;
    self.width = nil;
    self.height = nil;
    self.scale = nil;
    
    [super dealloc];
}


@end
