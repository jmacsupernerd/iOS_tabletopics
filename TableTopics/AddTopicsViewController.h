//
//  AddTopicsViewController.h
//  TableTopics
//
//  Created by Joshua McWilliams on 10/5/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AddTopicsViewController : UITableViewController

- (IBAction) addTopic:(id)sender;
@property (nonatomic, retain) NSFetchedResultsController    *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext        *managedObjectContext;
@property (nonatomic,strong)  NSArray *fetchedObjects;
@property (nonatomic,strong)  NSMutableArray *categoryNames;
@end
