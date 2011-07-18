//
//  Multi_Xib_AC_Share_AppDelegate.h
//  Multi_Xib_AC_Share
//
//  Created by 宮里 悠平 on 2/20/10.
//  Copyright __MyCompanyName__ 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ArrayControllerFix.h"
#import "SubWindowController.h"

@interface Multi_Xib_AC_Share_AppDelegate : NSObject 
{
    IBOutlet NSWindow *window;
		
		IBOutlet id artist;
		IBOutlet id song;
	
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
}
@property (assign) IBOutlet id artist, song;

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;

- (IBAction)saveAction:sender;

- (IBAction)showOrHideSubWindow:(id)sender;
	
@end
