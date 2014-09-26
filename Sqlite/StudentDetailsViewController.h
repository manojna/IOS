//
//  StudentDetailsViewController.h
//  Sqlite
//
//  Created by Paradigm on 9/24/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Sqlite3.h>
#import "StudentObject.h"

@protocol DoneProtocol <NSObject>

@end

@interface StudentDetailsViewController : UIViewController
{
    sqlite3 *database;
}

@property (weak, nonatomic) IBOutlet UITextField *studentId;
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UITextField *StuDepartment;
@property (weak, nonatomic) IBOutlet UITextField *studentAge;
- (IBAction)editButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *editToDone;
@property(weak,nonatomic)id<DoneProtocol>doneDelegate;

@property(nonatomic,strong)NSString *primaryKey;
-(void)studentDetails;
@end
