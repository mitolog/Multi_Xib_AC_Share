//
//  ArrayControllerFix.m
//  validation
//
//  Created by 宮里 悠平 on 2/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ArrayControllerFix.h"


@implementation ArrayControllerFix

- (void)awakeFromNib {
	[super awakeFromNib];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
																					 selector:@selector(coreDataEntityDidChange:) 
																							 name:NSManagedObjectContextObjectsDidChangeNotification 
																						 object:[self managedObjectContext]];
}

- (void)coreDataEntityDidChange:(NSNotification *)notification {
	if ([self sortDescriptors] && ([[self sortDescriptors] count]!=0)) {
		NSArray *insertedEntities = [[[notification userInfo] valueForKey:NSInsertedObjectsKey] valueForKeyPath:@"entity.name"];
		NSArray *updatedEntities  = [[[notification userInfo] valueForKey:NSUpdatedObjectsKey] valueForKeyPath:@"entity.name"];
		NSArray *deletedEntities  = [[[notification userInfo] valueForKey:NSDeletedObjectsKey] valueForKeyPath:@"entity.name"];
		
		NSString *entityName = [self entityName];
		if ([insertedEntities containsObject:entityName] || [updatedEntities containsObject:entityName] || [deletedEntities containsObject:entityName]) {
			[super rearrangeObjects];
		}
	}
}

@end
