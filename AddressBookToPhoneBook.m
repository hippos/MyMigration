//
//  AddressBookToPhoneBook.m
//  MyMigration
//
//  Created by hippos on 10/04/28.
//  Copyright 2010 hippos-lab.com. All rights reserved.
//

#import "AddressBookToPhoneBook.h"


@implementation AddressBookToPhoneBook

- (BOOL)beginEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError * *)error
{
  NSLog(@"beginEntityMapping");
  return YES;
}

- (BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance entityMapping:(NSEntityMapping *)
mapping manager:(NSMigrationManager *)manager error:(NSError **)error
{
  NSLog(@"createDestinationInstancesForSourceInstance");
  NSLog(@"%@ %@", [sInstance valueForKey:@"firstName"], [sInstance valueForKey:@"lastName"]);

  NSManagedObjectContext *moc     = [manager destinationContext];
  NSString               *dEntity = [mapping destinationEntityName];

  NSString *sPhone1 = [sInstance valueForKey:@"phone1"];

  if (sPhone1 != nil && [sPhone1 length] > 0)
  {
    NSManagedObject *dPhone1 = [NSEntityDescription insertNewObjectForEntityForName:dEntity
                                inManagedObjectContext:moc];
    [dPhone1 setValue:sPhone1 forKey:@"phoneNumber"];
    [dPhone1 setValue:[NSNumber numberWithInt:1] forKey:@"type"];
    [manager associateSourceInstance:sInstance withDestinationInstance:dPhone1 forEntityMapping:mapping];
  }

  NSString *sPhone2 = [sInstance valueForKey:@"phone2"];

  if (sPhone2 != nil && [sPhone2 length] > 0)
  {
    NSManagedObject *dPhone2 = [NSEntityDescription insertNewObjectForEntityForName:dEntity
                                inManagedObjectContext:moc];
    [dPhone2 setValue:sPhone2 forKey:@"phoneNumber"];
    [dPhone2 setValue:[NSNumber numberWithInt:2] forKey:@"type"];
    [manager associateSourceInstance:sInstance withDestinationInstance:dPhone2 forEntityMapping:mapping];
  }

  return YES;
}

- (BOOL)endInstanceCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError * *)error
{
  NSLog(@"endInstanceCreationForEntityMapping");
  return YES;
}

- (BOOL)createRelationshipsForDestinationInstance:(NSManagedObject *)dInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError **)error
{
  NSLog(@"createRelationshipsForDestinationInstance");
  NSLog(@"%@ %@ :Tel %@", 
        [[dInstance valueForKey:@"addressBook"] valueForKey:@"firstName"],
        [[dInstance valueForKey:@"addressBook"] valueForKey:@"lastName"],
        [dInstance valueForKey:@"phoneNumber"]);        
  return YES;
}

- (BOOL)endRelationshipCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError **)error
{
  NSLog(@"endRelationshipCreationForEntityMapping");
  return YES;
}

- (BOOL)performCustomValidationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError **)error
{
  NSLog(@"performCustomValidationForEntityMapping");
  return YES;
}

- (BOOL)endEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError **)error
{
  NSLog(@"endEntityMapping");
  return YES;
}

@end
