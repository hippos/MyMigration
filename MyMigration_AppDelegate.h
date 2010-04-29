//
//  MyMigration_AppDelegate.h
//  MyMigration
//
//  Created by hippos on 10/04/27.
//  Copyright hippos-lab.com 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyMigration_AppDelegate : NSObject <NSApplicationDelegate>
{
  NSWindow                     *window;

  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSManagedObjectModel         *managedObjectModel;
  NSManagedObjectContext       *managedObjectContext;
}

@property (nonatomic, retain) IBOutlet NSWindow                      *window;

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSManagedObjectModel         *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext       *managedObjectContext;

- (IBAction)           saveAction:sender;

@end
