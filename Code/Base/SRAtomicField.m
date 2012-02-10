//
//  SRAtomicField.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRAtomicField.h"
#import "SRObject+Private.h"

@implementation SRAtomicField

@synthesize defaultValue, choices, includeBlankChoice;

+ (NSArray *)attributeNames {
    return [[super attributeNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"default_value", @"choices", @"include_blank_choice", nil]];
}

- (void)dealloc {
    self.defaultValue = nil;
    self.choices = nil;
    self.includeBlankChoice = nil;
    
    [super dealloc];
}

- (void)addToObjectMapping:(RKObjectMapping *)anObjectMapping {
    [super addToObjectMapping:anObjectMapping];
    
    [[self class] addAttributeWithName:self.identifier toObjectMapping:anObjectMapping];
}

@end
