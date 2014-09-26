//
//  EmployeeTableViewController.h
//  CoreDataTask
//
//  Created by Paradigm on 9/25/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EmployeeTableViewController : UITableViewController<NSFetchedResultsControllerDelegate,UIAlertViewDelegate>

@property(nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic,strong) NSFetchedResultsController *fetchResultsController;
@property (strong, nonatomic) IBOutlet UITableView *employeeTable;
- (IBAction)addDetails:(id)sender;


@end
