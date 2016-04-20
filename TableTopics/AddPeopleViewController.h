//
//  AddPeopleViewController.h
//  TableTopics
//
//  Created by Joshua McWilliams on 10/5/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPeopleViewController : UITableViewController


- (IBAction) addPerson:(id)sender;
@property (nonatomic, retain) NSFetchedResultsController    *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext        *managedObjectContext;
@property (nonatomic,strong)  NSArray *fetchedObjects;
@property (nonatomic,strong)  NSMutableArray *names;

@end
