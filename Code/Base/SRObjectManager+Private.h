//
//  SRObjectManager+Private.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/11/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRObjectManager.h"

@interface SRObjectManager (SRPrivate)

+ (NSString *)userAgent;
+ (NSString *)currentVersion;

+ (NSArray *)mappableObjectClasses; 
+ (NSArray *)mappableEntryClasses;

+ (BOOL)isMappableEntryClass:(Class)class;
+ (BOOL)isNSManagedObjectClass:(Class)class;
+ (BOOL)isMappableObjectClass:(Class)class; 

- (void)loadMappableObjects;

@end