//
//  SRImageField.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRImageField.h"

#import "SRImageVersion.h"

@implementation SRImageField

@synthesize versions;

+ (NSMutableDictionary *)relationships {
    NSMutableDictionary *relationships = [super relationships];
    
    [relationships setObject:[SRImageVersion class] forKey:@"versions"];
    
    return relationships;
}

- (void)dealloc {
    self.versions = nil;
    
    [super dealloc];
}

@end
