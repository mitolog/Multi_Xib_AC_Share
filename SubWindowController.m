//
//  SubWindowController.m
//  Multi_Xib_AC_Share
//
//  Created by 宮里 悠平 on 2/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SubWindowController.h"


@implementation SubWindowController
#pragma mark *** class initialize ***
static id _subWindowController = nil;
+ (id)subWindowController
{
	@synchronized(self) {   //support multiThreading anyway
		if (!_subWindowController) {
			_subWindowController = [[self allocWithZone:NULL] init];
		}
	}
	return _subWindowController;	
}

- (id)init {
	self = [self initWithWindowNibName:@"Sub"];
	if (self) {
		[self setWindowFrameAutosaveName:@"Sub"];
	}
	return self;
}

//for creating perfect Singleton
+ (id)allocWithZone:(NSZone*)zone
{
	@synchronized(self) {
		if (!_subWindowController) {
			_subWindowController = [super allocWithZone:zone];
			return _subWindowController;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone*)zone
{
	return self;
}
@end
