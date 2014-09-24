//
//  EmployeeTableViewController.h
//  Sqlite
//
//  Created by Paradigm on 9/22/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "StudentObject.h"
#import "DetailsViewController.h"
#import "StudentDetailsViewController.h"

@interface EmployeeTableViewController : UITableViewController
{
    sqlite3 *database;
}

-(void)submitClicked:(NSString *)nameText secondParameter:(NSString *)designationText thirdParameter:(NSString *)ageText;

@property(nonatomic,strong)NSIndexPath *indexPathToBeDeleted;
-(NSString *)goToProject;
-(NSString *)goToDocument;
-(void)copyFilesOfDb;
-(void)getStudentDetails;

@end
