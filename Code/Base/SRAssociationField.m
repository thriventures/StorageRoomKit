//
//  SRAssociationField.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRAssociationField.h"

#import "SRAssociation.h"
#import "SRObject+Private.h"

@implementation SRAssociationField

@synthesize collectionUrl;

+ (NSArray *)attributeNames {
    return [[super attributeNames] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"collection_url", nil]];
}

- (void)dealloc {
    self.collectionUrl = nil;
    
    [super dealloc];
}

- (void)addToObjectMapping:(RKObjectMapping *)anObjectMapping {
    [super addToObjectMapping:anObjectMapping];
    
    [[self class] addRelationshipWithName:self.identifier relationshipMapping:[SRAssociation objectMapping] toObjectMapping:anObjectMapping];
}



@end
