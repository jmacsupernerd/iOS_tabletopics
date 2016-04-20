//
//  Person.h
//  TableTopics
//
//  Created by Joshua McWilliams on 10/5/13.
//  Copyright (c) 2013 Joshua McWilliams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;

@end
