//
//  SRWebhookDefinition.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/8/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SREmbedded.h"

/**
 * The definition of a Webhook
 *
 * @see SRCollection
 */
@interface SRWebhookDefinition : SREmbedded {
    NSString *url;
    NSString *username;
    NSString *password;
    NSNumber *onCreate;
    NSNumber *onUpdate;
    NSNumber *onDelete;
    NSNumber *api;
    NSNumber *webInterface;
}

/**
 * The URL the POST request will be sent to.
 */
@property (nonatomic, retain) NSString *url;

/**
 * The HTTP basic username (optional)
 */
@property (nonatomic, copy) NSString *username;

/**
 * The HTTP basic password (optional)
 */
@property (nonatomic, copy) NSString *password;

/**
 * Perform the webhook when a new Resource is created.
 */
@property (nonatomic, retain) NSNumber *onCreate;

/**
 * Perform the webhook when an existing Resource is updated.
 */
@property (nonatomic, retain) NSNumber *onUpdate;

/**
 * Perform the webhook when an existing Resource is deleted.
 */
@property (nonatomic, retain) NSNumber *onDelete;

/**
 * Perform the webhook when a Resource is modified through the API.
 */
@property (nonatomic, retain) NSNumber *api;

/**
 * Perform the webhook when a Resource is modified through the web interface.
 */
@property (nonatomic, retain) NSNumber *webInterface;

@end