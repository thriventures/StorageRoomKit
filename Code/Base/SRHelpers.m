//
//  SRHelpers.m
//  StorageRoomRestKit
//
//  Created by Sascha Konietzke on 7/13/11.
//  Copyright 2011 Thriventures. All rights reserved.
//

#import "SRHelpers.h"

#import "objc/runtime.h"
#import "NSString+InflectionSupport.h"
#import "SRObjectManager.h"

#pragma mark -
#pragma mark Path/URL helpers

NSString *SRAccountPath(NSString *accountId) {
    return [NSString stringWithFormat:@"/accounts/%@", accountId];
}

NSString *SRCollectionsPath(void) {
    return @"/collections";
}

NSString *SRCollectionPath(NSString *collectionId) {
    return [NSString stringWithFormat:@"%@/%@", SRCollectionsPath(), collectionId];
}

NSString *SRCollectionEntriesPath(NSString *collectionId) {
    return [NSString stringWithFormat:@"%@/entries", SRCollectionPath(collectionId)];
}

NSString *SRCollectionEntryPath(NSString *collectionId, NSString *entryId) {
    return [NSString stringWithFormat:@"%@/%@", SRCollectionEntriesPath(collectionId), entryId];
}

NSString *SRDeletedEntriesPath(void) {
    return @"/deleted_entries";
}

NSString *SRDeletedEntriesForCollection(NSString *collectionUrl) {
    return RKPathAppendQueryParams(SRDeletedEntriesPath(), [NSDictionary dictionaryWithObject:collectionUrl forKey:@"collection_url"]);
}

NSString *SRAbsoluteUrlToRelativePath(NSString *absoluteURL) { 
    NSURL *url = [NSURL URLWithString:absoluteURL];
    NSString *path = [url relativeString];
    NSArray *components = [path componentsSeparatedByString:@"/"];
    NSRange range = NSMakeRange(5, [components count] - 5);
    NSString *newPath = [@"/" stringByAppendingString:[[components subarrayWithRange:range] componentsJoinedByString:@"/"]];
    
    return newPath;
}

NSString *SRPathAppendQueryParams(NSString *resourcePath, NSDictionary *queryParams) {
	if ([queryParams count] > 0) {
        NSURL *url = RKMakeURL(resourcePath);
        NSString *separator = [url query] ? @"&" : @"?";
        
		return [NSString stringWithFormat:@"%@%@%@", resourcePath, separator, [queryParams URLEncodedString]];
	} else {
		return resourcePath;
	}
}

#pragma mark -
#pragma mark Other helpers

NSString *SRMeta(NSString *aName) {
    return [NSString stringWithFormat:@"%@%@", [SRObjectManager metaPrefix], aName];
}

NSString *SRAppendOperator(NSString *base, NSString *op) {
    return [NSString stringWithFormat:@"%@!%@", base, op];
}

NSString *SRTypeAttribute(void) { 
    return SRMeta(@"type");
}

NSString *SRIdentifierToObjectiveC(NSString *aName) {
    return [aName camelize];
}

NSString *SRObjectiveCToIdentifier(NSString *aName) {
    return [aName underscore];
}

NSArray *SRSubclasses(Class aClass) {
    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;
    
    classes = malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger i = 0; i < numClasses; i++) {
        Class superClass = classes[i];
        do {
            superClass = class_getSuperclass(superClass);
        } while(superClass && superClass != aClass);
        
        if (superClass == nil) {
            continue;
        }
        
        [result addObject:classes[i]];
    }
    
    free(classes);
    
    return result;
}

NSString *SRIdFromUrl(NSString *aUrl) {
    NSArray *components = [aUrl componentsSeparatedByString:@"/"];
    return [components lastObject];
}
