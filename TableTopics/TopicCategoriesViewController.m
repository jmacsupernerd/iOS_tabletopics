//
//  TopicCategoriesViewController.m
//  TableTopics
//
//  Created by Joshua McWilliams on 10/6/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import "TopicCategoriesViewController.h"
#import "TopicCategoryDetailViewController.h"

@interface TopicCategoriesViewController ()

@end

@implementation TopicCategoriesViewController
@synthesize categoryNamesObj;

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
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //[spinner setCenter:CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0)];
    [self.tableView addSubview:spinner]; // spinner is not visible until started
    [spinner startAnimating];
    
    UIColor * color = [UIColor colorWithRed:54/255.0f green:214/255.0f blue:251/255.0f alpha:1.0f];
    self.navigationController.navigationBar.barTintColor = color;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    categoryNamesObj = [[NSMutableArray alloc] init];

    
    PFQuery *query = [PFQuery queryWithClassName:@"Categories"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu categories.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", [object objectForKey:@"categoryName"]);
                NSString *categoryName = [object objectForKey:@"categoryName"];
                
                NSLog(@"Name of Categories: %@", categoryName);
                [self.categoryNamesObj addObject:categoryName];
                
                
            }
            [spinner stopAnimating];
            NSLog(@"ArrayList of Categories: %@", categoryNamesObj);
            [self.tableView reloadData];
            
        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];
    

    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return categoryNamesObj.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //Topic *topic = [fetchedObjects objectAtIndex:indexPath.row];
    NSString *category = [categoryNamesObj objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    cell.textLabel.text = category;
    NSLog(@"cellContent: %@", category);
    
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"categoryToTopics"])
    {
        // Get reference to the destination view controller
        TopicCategoryDetailViewController *vc = [segue destinationViewController];
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        NSString *selectedCategory = [categoryNamesObj objectAtIndex:indexPath.row];
        vc.categoryName = selectedCategory;
        
        NSLog(@"Passed %@", selectedCategory);
        // Pass any objects to the view controller here, like...
        //[vc setMyObjectHere:object];
    }
}



@end
