//
//  SRObjectMappingProvider.m
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/11/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRObjectMappingProvider.h"

#import "SRObjectManager.h"
#import "SRObjectManager+Private.h"
#import "SRObject.h"
#import "SREntry.h"


@implementation SRObjectMappingProvider

- (RKObjectMapping *)serializationMappingForClass:(Class)objectClass {
    if ([SRObjectManager isMappableEntryClass:objectClass]) {
        RKLogDebug(@"Searching serialization mapping for %@", NSStringFromClass(objectClass));
        
        for (NSString *type in [SRObjectManager entryObjectMappings]) {
            RKObjectMapping *objectMapping = [[SRObjectManager entryObjectMappings] objectForKey:type];
            if ([objectMapping objectClass] == objectClass) {
                RKObjectMapping *inverseMapping = [objectMapping inverseMapping];
                inverseMapping.rootKeyPath = [SREntry objectKeyPath];
                
                return inverseMapping;
            }
        }
        
        return nil;
    }
    else {
        RKObjectMapping *mapping = [super serializationMappingForClass:objectClass];

        if ([objectClass isSubclassOfClass:[SRObject class]]) {
            mapping.rootKeyPath = [objectClass objectKeyPath];            
        }
        
        return mapping;
    }
}

@end
