//
//  RKObjectMapping+SRExtension.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "RKObjectMapping+SRExtension.h"

#import "NSString+InflectionSupport.h"

#import "SREmbedded.h"
#import "SRHelpers.h"

#import <RestKit/RestKit.h>

@implementation RKObjectMapping (SRExtension)

- (void)mapSRAttributes:(NSString*)attributeKey, ... {
    va_list args;
    va_start(args, attributeKey);
    
    for (NSString* keyPath = attributeKey; keyPath != nil; keyPath = va_arg(args, NSString*)) {
        [self mapKeyPath:keyPath toAttribute:SRIdentifierToObjectiveC(keyPath)];
    }
    
    va_end(args);
}

- (void)mapSRMetaData:(NSString*)attributeKey, ... {
    va_list args;
    va_start(args, attributeKey);
    
    for (NSString* keyPath = attributeKey; keyPath != nil; keyPath = va_arg(args, NSString*)) {
        NSString *metaKey = SRMeta(keyPath);
        NSString *camelizedKeyPath = SRIdentifierToObjectiveC(metaKey);       
        [self mapKeyPath:metaKey toAttribute:camelizedKeyPath];
    }
    
    va_end(args);
}

- (void)mapSRRelationships:(NSString*)relationshipName, ... {
    va_list args;
    va_start(args, relationshipName);
    
    for (NSString* keyPath = relationshipName; keyPath != nil; keyPath = va_arg(args, NSString*)) {
        [self mapRelationship:keyPath withMapping:[SREmbedded objectMapping]];
    }
    
    va_end(args);
}

@end
