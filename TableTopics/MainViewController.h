//
//  MainViewController.h
//  TableTopics
//
//  Created by Joshua McWilliams on 10/5/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "GADBannerView.h"


@interface MainViewController : UIViewController <ADBannerViewDelegate>
{
    IBOutlet UILabel *person;
    IBOutlet UILabel *topic;
    GADBannerView *bannerView_;
    
}

-(IBAction) generateTopicAndPerson:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *person;
@property (nonatomic, retain) IBOutlet UILabel *topic;

@property (nonatomic, retain) NSFetchedResultsController    *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext        *managedObjectContext;
@property (nonatomic,strong)  NSArray *fetchedPeople;
@property (nonatomic,strong)  NSArray *fetchedTopics;

@end
