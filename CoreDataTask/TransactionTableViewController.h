//
//  TransactionTableViewController.h
//  CoreDataTask
//
//  Created by Paradigm on 9/25/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EmployeeTableViewController.h"
#import "Employee.h"
#import "AppDelegate.h"
#import "Transactions.h"

@interface TransactionTableViewController : UITableViewController<NSFetchedResultsControllerDelegate,UIAlertViewDelegate>
@property(nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic,strong) NSFetchedResultsController *fetchResultControllers;
@property(nonatomic,strong)Employee *selectedEmployee;

- (IBAction)addtransaction:(id)sender;
@end
