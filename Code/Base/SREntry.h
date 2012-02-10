//
//  SREntry.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRModel.h"

@class SRCollection;

/**
 * Base class for automatically generated Entry classes.
 * You **don't** have to use this class as a superclass for your own custom classes.
 */
@interface SREntry : SRModel {
    
}

+ (SRCollection *)collection;
+ (void)setCollection:(SRCollection *)aCollection;

@end
