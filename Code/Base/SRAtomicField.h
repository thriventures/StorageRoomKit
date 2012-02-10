//
//  SRAtomicField.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRField.h"

/**
 * Abstract superclass for atomic fields
 */
@interface SRAtomicField : SRField {
    NSObject *defaultValue;
    NSArray *choices;
    NSNumber *includeBlankChoice;
}

/**
 * The default value of the Field.
 */
@property (nonatomic, retain) NSObject *defaultValue;

/**
 * An array of choices displayed in the editing interface.
 */
@property (nonatomic, retain) NSArray *choices;

/**
 * Include blank as a valid choice in the editing interface.
 */
@property (nonatomic, retain) NSNumber *includeBlankChoice;


@end
