//
//  TopicCategoryDetailViewController.h
//  TableTopics
//
//  Created by Joshua McWilliams on 10/7/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TopicCategoryDetailViewController : UITableViewController
@property (nonatomic,strong)  NSMutableArray *TopicsObj;
@property (nonatomic,strong)  NSString *categoryName;
@property (nonatomic, retain) NSFetchedResultsController    *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext        *managedObjectContext;
- (IBAction) importTopics:(id)sender;
@end
