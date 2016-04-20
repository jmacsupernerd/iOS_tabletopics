//
//  TabBarViewController.m
//  TableTopics
//
//  Created by Joshua McWilliams on 10/6/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIColor * color = [UIColor colorWithRed:54/255.0f green:214/255.0f blue:251/255.0f alpha:1.0f];
    [[UITabBar appearance] setBarTintColor:color];
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
    //[[UITabBar appearance] setSelectedImageTintColor:[UIColor redColor]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"selected_tab_bar.png"]];
    self.tabBarController.selectedIndex = 0;
  
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated {
     [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"selected_tab_bar.png"]];
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
