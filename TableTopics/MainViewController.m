//
//  MainViewController.m
//  TableTopics
//
//  Created by Joshua McWilliams on 10/5/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import "MainViewController.h"
#import "Person.h"
#import "Topic.h"

@interface MainViewController ()
@property (nonatomic, strong) IBOutlet UIView *contentView;

@end

@implementation MainViewController{

}

@synthesize fetchedResultsController, managedObjectContext, fetchedPeople, fetchedTopics, topic, person;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    UIColor * color = [UIColor colorWithRed:54/255.0f green:214/255.0f blue:251/255.0f alpha:1.0f];
    self.navigationController.navigationBar.barTintColor = color;
    
    NSError *error;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    fetchedPeople = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    
    NSFetchRequest *fetchRequest2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity2 = [NSEntityDescription entityForName:@"Topic" inManagedObjectContext:managedObjectContext];
    [fetchRequest2 setEntity:entity2];
    fetchedTopics = [managedObjectContext executeFetchRequest:fetchRequest2 error:&error];

    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"selected_tab_bar.png"]];
    //[self.view addSubview:_bannerView];

    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    // Specify the ad unit ID.
    bannerView_.adUnitID = @"ca-app-pub-8930204067777857/4920024630";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake)
    {
        int lengthOfPeople = fetchedPeople.count;
        int lengthOfTopics = fetchedTopics.count;
        
        
        if(lengthOfPeople == 0 || lengthOfTopics == 0){
            
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No topics or No people exist. Please add some!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            alert.alertViewStyle = UIAlertViewStyleDefault;
            [alert show];
            
        } else{
            
            NSInteger randomNumberForPeople = 0 + arc4random() % ((lengthOfPeople)- 0);
            NSLog(@"People: %i", randomNumberForPeople);
            
            NSInteger randomNumberForTopics = 0 + arc4random() % ((lengthOfTopics) - 0);
            NSLog(@"Topics: %i", randomNumberForTopics);
            
            Person *personObj = [fetchedPeople objectAtIndex:randomNumberForPeople];
            Topic *topicObj = [fetchedTopics objectAtIndex:randomNumberForTopics];
            
            person.text = personObj.name;
            topic.text = topicObj.topic;
        }

    }
}

-(void) viewDidAppear:(BOOL)animated {
    
    NSError *error;

    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    fetchedPeople = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    
    NSFetchRequest *fetchRequest2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity2 = [NSEntityDescription entityForName:@"Topic" inManagedObjectContext:managedObjectContext];
    [fetchRequest2 setEntity:entity2];
    fetchedTopics = [managedObjectContext executeFetchRequest:fetchRequest2 error:&error];
    
    [super viewDidAppear:animated];
}

-(IBAction)generateTopicAndPerson:(id)sender{
    
    int lengthOfPeople = fetchedPeople.count;
    int lengthOfTopics = fetchedTopics.count;
   
    
    if(lengthOfPeople == 0 || lengthOfTopics == 0){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No topics or No people exist. Please add some!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];
        
    } else{
        
        NSInteger randomNumberForPeople = 0 + arc4random() % ((lengthOfPeople)- 0);
        NSLog(@"People: %i", randomNumberForPeople);
        
        NSInteger randomNumberForTopics = 0 + arc4random() % ((lengthOfTopics) - 0);
        NSLog(@"Topics: %i", randomNumberForTopics);

        Person *personObj = [fetchedPeople objectAtIndex:randomNumberForPeople];
        Topic *topicObj = [fetchedTopics objectAtIndex:randomNumberForTopics];
    
        person.text = personObj.name;
        topic.text = topicObj.topic;
    }
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
