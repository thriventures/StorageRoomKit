//
//  SRAssociation.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/6/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRAssociation.h"

@implementation SRAssociation

@synthesize url;

+ (NSArray *)attributeNames {
    return [[super attributeNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"url", nil]];
}

- (void)dealloc {
    self.url = nil;
    
    [super dealloc];
}

@end
