//
//  StudentDetailsViewController.m
//  Sqlite
//
//  Created by Paradigm on 9/24/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "StudentDetailsViewController.h"

@interface StudentDetailsViewController ()

@end

@implementation StudentDetailsViewController

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
    [super viewDidLoad];

    _studentId.text=_primaryKey;
    [_studentName setEnabled:NO];
    [_studentId setEnabled:NO];
    [_StuDepartment setEnabled:NO];
    [_studentAge setEnabled:NO];
    
    [self studentDetails];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *)goToDocument
{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *dbPath = [array objectAtIndex:0];
    dbPath = [dbPath stringByAppendingPathComponent:@"Student.sqlite"];
    return dbPath;
}

-(void)studentDetails
{
    NSString *dbFilePath =[self goToDocument];
    const char *dbUtfString = [dbFilePath UTF8String];
    if (sqlite3_open(dbUtfString, &database)==SQLITE_OK)
    {
        NSString *selectQuery = [NSString stringWithFormat:@"Select * from  StudentTable where StudentId='%@'",_primaryKey];

        const char *queryUtf8 = [selectQuery UTF8String];
        sqlite3_stmt *statment;
        if (sqlite3_prepare(database, queryUtf8, -1, &statment, NULL)==SQLITE_OK )
        {
            while (sqlite3_step(statment)==SQLITE_ROW)
            {
                StudentObject *stuObject= [[StudentObject alloc] init];
                stuObject.studentId= [NSString stringWithFormat:@"%d",sqlite3_column_int(statment, 0)];
                stuObject.studentName =[NSString stringWithFormat:@"%s", (char*)sqlite3_column_text(statment, 1)];
                stuObject.studentDepartment =[NSString stringWithFormat:@"%s", (char*)sqlite3_column_text(statment, 2)];
                stuObject.studentAge= [NSString stringWithFormat:@"%d",sqlite3_column_int(statment, 3)];
               
                self.studentId.text =stuObject.studentId;
                self.studentName.text =stuObject.studentName;
                self.StuDepartment.text =stuObject.studentDepartment;
                self.studentAge.text =stuObject.studentAge;
    
            }
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
}


- (IBAction)editButton:(id)sender {
    [_studentName setEnabled:YES];
    [_studentId setEnabled:YES];
    [_StuDepartment setEnabled:YES];
    [_studentAge setEnabled:YES];
    
    [_editToDone setTitle:@"Done" forState:UIControlStateNormal];
    
    if ([_editToDone.titleLabel.text isEqual:@"Done"])
    {
        NSString *dbFilePath = [self goToDocument];
        const char *dbUtfString =[dbFilePath UTF8String];
        if (sqlite3_open(dbUtfString, &database)==SQLITE_OK)
        {
            NSString *selectQuery = [NSString stringWithFormat:@"Update StudentTable set studentName='%@',studentDepartment='%@',studentAge=%d where StudentId='%@'",_studentName.text,_StuDepartment.text,[_studentAge.text intValue],_primaryKey];;
            const char *queryUtf8 = [selectQuery UTF8String];
            sqlite3_stmt *statment;
            if (sqlite3_prepare(database, queryUtf8, -1, &statment, NULL)==SQLITE_OK )
            {
                if(sqlite3_step(statment)==SQLITE_DONE)
                {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }
            }
            sqlite3_finalize(statment);
        }
        sqlite3_close(database);
    }
}
@end
