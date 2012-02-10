//
//  SRCompoundField.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRCompoundField.h"


@interface SRImageField : SRCompoundField {
    NSArray *versions;
}
    
@property (nonatomic, retain) NSArray *versions;

@end
