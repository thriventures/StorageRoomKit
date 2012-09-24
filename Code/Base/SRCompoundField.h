//
//  SRCompoundField.h
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRField.h"

/**
 * Abstract superclass for compound Fields
 */
@interface SRCompoundField : SRField {
    
}

- (RKObjectMappingDefinition *)relationshipMapping;

@end
