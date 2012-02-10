//
//  SROneAssociationField.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SROneAssociationField.h"


@implementation SROneAssociationField

- (void)addToObjectMapping:(RKObjectMapping *)anObjectMapping {
    [super addToObjectMapping:anObjectMapping];
    
    //    klass.send(:one, identifier)
}

@end
