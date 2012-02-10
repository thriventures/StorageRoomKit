//
//  SRAssociation.h
//  StorageRoomKit
//
//  Created by Sascha Konietzke on 8/6/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SREmbedded.h"

@interface SRAssociation : SREmbedded {
    NSString *url;
}

@property (nonatomic, copy) NSString *url;


@end
