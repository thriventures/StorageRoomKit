//
//  SRCompoundField.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRCompoundField.h"

#import "SRObject+Private.h"

@implementation SRCompoundField

- (void)addToObjectMapping:(RKObjectMapping *)anObjectMapping {
    [super addToObjectMapping:anObjectMapping];
    
    [[self class] addRelationshipWithName:self.identifier relationshipMapping:[self relationshipMapping] toObjectMapping:anObjectMapping];
}

- (RKObjectMappingDefinition *)relationshipMapping {
    NSString *className = NSStringFromClass([self class]);
    NSUInteger index = [className length] - [@"Field" length];
    NSString *targetClassName = [className substringToIndex:index];
        
    Class targetClass = NSClassFromString(targetClassName);
    
    return [targetClass objectMapping];
}



@end
