//
//  SRWebhookDefinition.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/8/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRWebhookDefinition.h"

@implementation SRWebhookDefinition

@synthesize url, username, password, onCreate, onUpdate, onDelete, api, webInterface;

+ (NSArray *)attributeNames {
    return [[super attributeNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"url", @"username", @"password", @"onCreate", @"onUpdate", @"onDelete", @"api", @"webInterface", nil]];
}

- (void)dealloc {
    self.url = nil;
    self.username = nil;
    self.password = nil;
    self.onCreate = nil;
    self.onUpdate = nil;
    self.onDelete = nil;
    self.api = nil;
    self.webInterface = nil;
    
    [super dealloc];
}


@end