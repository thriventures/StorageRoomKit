//
//  SRCollection.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRModel.h"

/**
 * Class for the Collection Resource. This Resource contains the definition of other Entry Resources.
 */
@interface SRCollection : SRModel {
    NSString *name;
    NSString *entryType;
    NSString *primaryFieldIdentifier;
    NSArray *fields;
    NSArray *webhookDefinitions;
    NSString *mAccountUrl;
    NSString *mEntriesUrl;
}

/**
 * The name of the Collection.
 */
@property (nonatomic, copy) NSString *name;

/**
 * The entry type of the Collection.
 */
@property (nonatomic, copy) NSString *entryType;

/**
 * The identifier name of the primary Field.
 *
 * @see SRField
 */
@property (nonatomic, copy) NSString *primaryFieldIdentifier;

/**
 * An array of all Fields
 *
 * @see SRField
 */
@property (nonatomic, retain) NSArray *fields;

/**
 * An array of all Webhook Definitions
 *
 * @see SRWebhookDefinition
 */
@property (nonatomic, retain) NSArray *webhookDefinitions;

/**
 * The Url to the Account of the Collection
 *
 * @see SRAccount
 */
@property (nonatomic, copy) NSString *mAccountUrl;

/**
 * The Url to the Entries of the Collection
 *
 * @see SREntry
 */
@property (nonatomic, copy) NSString *mEntriesUrl;

/**
 * Generates a class on runtime for the Entries of the Collection and registers it with the mapping provider. 
 * You don't need to implement your own class but you won't be able to do any customizations.
 */
- (void)createAndRegisterEntryClass;



@end


