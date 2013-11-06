//
//  ParkinghistoryViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 10/5/13.
//  Copyright (c) 2013 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ParkinghistoryViewController : UITableViewController<NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end
