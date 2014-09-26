//
//  EmployeeTableViewController.m
//  Sqlite
//
//  Created by Paradigm on 9/22/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "EmployeeTableViewController.h"

@interface EmployeeTableViewController ()

@end

@implementation EmployeeTableViewController
NSMutableArray *studentDetails;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    studentDetails = [[NSMutableArray alloc] init];
    [self getStudentDetails];
    [self copyFilesOfDb];
}

-(NSString *)goToProject
{
    NSString *sqliteFilePath = [[NSBundle mainBundle] bundlePath];
    sqliteFilePath = [sqliteFilePath stringByAppendingPathComponent:@"Student.sqlite"];
    return sqliteFilePath;
}

-(NSString *)goToDocument
{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *dbPath = [array objectAtIndex:0];
    dbPath = [dbPath stringByAppendingPathComponent:@"Student.sqlite"];
    return dbPath;
}

-(void)copyFilesOfDb
{
    NSString *appDbPath = [self goToProject];
    NSString *documentDbPath = [self goToDocument];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:documentDbPath])
    {
        BOOL isSucess = [fileManager copyItemAtPath:appDbPath toPath:documentDbPath error:nil];
        if (isSucess) {
            
            NSLog(@"Copied Sucess");
        }
        else{
            NSLog(@"Copied Failure");
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return studentDetails.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailcell" forIndexPath:indexPath];
    StudentObject *stuObj = [studentDetails objectAtIndex:indexPath.row];
    cell.textLabel.text=stuObj.studentName;
    cell.detailTextLabel.text=stuObj.studentId;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    _indexPathToBeDeleted=indexPath;
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Are you sure?" delegate:self
            cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
         [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"NO"])
    {
        NSLog(@"Nothing to do here");
    }
    else if([title isEqualToString:@"YES"])
    {
        StudentObject *tempObject=[studentDetails objectAtIndex:_indexPathToBeDeleted.row];
        [self deleteFromDb:tempObject.studentId];

        [studentDetails removeObjectAtIndex:[self.indexPathToBeDeleted row]];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPathToBeDeleted] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView reloadData];
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"detailcell"])
    {
        DetailsViewController *amountdetail = [segue destinationViewController];
        amountdetail.Delegate = self;
    }
    else if([[segue identifier] isEqualToString:@"StudentDetails"])
    {
        StudentDetailsViewController *StudentDetails=[segue destinationViewController];
        NSIndexPath *selectedIndexpath=[self.tableView indexPathForSelectedRow];
        StudentObject *student=[studentDetails objectAtIndex:selectedIndexpath.row];
        StudentDetails.primaryKey=student.studentId;
    }
}
#pragma mark - Database

-(void)submitClicked:(NSString *)nameText secondParameter:(NSString *)designationText thirdParameter:(NSString *)ageText
{
    
    NSString *dbFilePath =[self goToDocument];
    const char *dbUtfString = [dbFilePath UTF8String];
    if (sqlite3_open(dbUtfString, &database)==SQLITE_OK)
    {
        NSString *name =nameText;
        NSString *idValue =[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
        NSString *designation =designationText;
        NSString *age = ageText;
        
        NSString *insertQuery = [NSString stringWithFormat:@"insert into StudentTable(studentId,studentName,studentDepartment,studentAge) values(%d,'%@','%@',%d)",[idValue intValue],name,designation,[age intValue]];
        
        StudentObject *studentTemp=[[StudentObject alloc] init];
        studentTemp.studentName=name;
        studentTemp.studentId=idValue;
        studentTemp.studentAge=age;
        studentTemp.studentDepartment=designation;
        [studentDetails addObject:studentTemp];
        
        const char *queryUtf8 = [insertQuery UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_prepare(database, queryUtf8, -1, &statement, NULL)==SQLITE_OK)
        {
            if (sqlite3_step(statement)==SQLITE_DONE)
            {    
                NSLog(@"Inserted Scussessfully");
                [self.tableView reloadData];
                
            }
            
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
}

-(void)getStudentDetails
{
    NSString *dbFilePath =[self goToDocument];
    const char *dbUtfString = [dbFilePath UTF8String];
    if (sqlite3_open(dbUtfString, &database)==SQLITE_OK)
    {
        NSString *selectQuery = [NSString stringWithFormat:@"Select * from  StudentTable"];
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
                 [studentDetails addObject:stuObject];
            }
             [self.tableView reloadData];
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
}

-(void)deleteFromDb:(NSString *)studentId{
    
    NSString *dbFilePath =[self goToDocument];
    const char *dbUtfString = [dbFilePath UTF8String];
    if (sqlite3_open(dbUtfString, &database)==SQLITE_OK)
    {
        NSString *selectQuery = [NSString stringWithFormat:@"delete from  StudentTable where StudentId='%@'",studentId];
        const char *queryUtf8 = [selectQuery UTF8String];
        sqlite3_stmt *statment;
        if (sqlite3_prepare(database, queryUtf8, -1, &statment, NULL)==SQLITE_OK)
        {
            if(sqlite3_step(statment)==SQLITE_ROW)
            {
                NSLog(@"Deleted Successfully");
            }
            
            [self.tableView reloadData];
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
}@end
