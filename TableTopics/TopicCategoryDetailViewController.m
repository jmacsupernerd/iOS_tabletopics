//
//  TopicCategoryDetailViewController.m
//  TableTopics
//
//  Created by Joshua McWilliams on 10/7/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import "TopicCategoryDetailViewController.h"
#import "Topic.h"
#import "AddTopicsViewController.h"

@interface TopicCategoryDetailViewController ()

@end

@implementation TopicCategoryDetailViewController
@synthesize categoryName, TopicsObj, fetchedResultsController, managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.title = categoryName;
    [super viewDidLoad];
    
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    [[self.navigationController.navigationBar backItem] setTitle:@""];

    
    TopicsObj = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:categoryName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d topics.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", [object objectForKey:@"topic"]);
                NSString *topic = [object objectForKey:@"topic"];
                
                NSLog(@"Topic: %@", topic);
                [self.TopicsObj addObject:topic];
                
                
            }
            NSLog(@"ArrayList of Topics: %@", TopicsObj);
            [self.tableView reloadData];
            
        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction) importTopics:(id)sender{
    
    for (int i = 0; i < TopicsObj.count; i++) {
        
        NSString *topicToAdd = [TopicsObj objectAtIndex:i];
   
        NSLog(@"Topic:%@",topicToAdd);
        Topic *topic = (Topic *)[NSEntityDescription insertNewObjectForEntityForName:@"Topic" inManagedObjectContext:managedObjectContext];
        topic.topic = topicToAdd;
    
        NSError *error;
    
    // here's where the actual save happens, and if it doesn't we print something out to the console
        if (![managedObjectContext save:&error])
        {
            NSLog(@"Problem saving: %@", [error localizedDescription]);
        }
        
    }
    
    AddTopicsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    //vc.categoryNamesObj = [[NSMutableArray alloc] initWithArray:categoryNames];
    [self presentViewController:vc animated:YES completion:nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return TopicsObj.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *topic = [TopicsObj objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = topic;
    NSLog(@"cellContent: %@", topic);
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
