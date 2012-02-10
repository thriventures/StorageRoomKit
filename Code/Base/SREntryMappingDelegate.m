//
//  SREntryMappingDelegate.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/9/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SREntryMappingDelegate.h"

#import "SRObjectManager.h"
#import "SRHelpers.h"


@implementation SREntryMappingDelegate

- (NSString *)typeForData:(id)data {
    return [(NSDictionary *)data objectForKey:SRTypeAttribute()];    
}

- (RKObjectMapping *)objectMappingForData:(id)data {
    return [[SRObjectManager entryObjectMappings] objectForKey:[self typeForData:data]];
}

@end
