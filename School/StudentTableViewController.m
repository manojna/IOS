//
//  StudentTableViewController.m
//  School
//
//  Created by Paradigm on 9/16/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "StudentTableViewController.h"
#import "FirstTableViewController.h"
#import "SectionTableViewController.h"
#import "SectionDetails.h"
#import "ClassDetails.h"
#import "DetailsTableViewController.h"
#import "StudentObject.h"

@interface StudentTableViewController ()
{
    NSMutableArray *studentDetails;
}
@end

@implementation StudentTableViewController

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
    
    self.title = _secRef.secName;
    
    studentDetails = [[NSMutableArray alloc]init];
    
    for (int i=0; i<_secRef.studentsArray; i++) {
        StudentObject *studObj = [[StudentObject alloc]init];
        studObj.studSection = _secRef;
        studObj.studentName = [NSString stringWithFormat:@"%d",i];
        [studentDetails addObject:studObj];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return studentDetails.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentcell"];
    
    StudentObject *student=[studentDetails objectAtIndex:indexPath.row];
    cell.textLabel.text = student.studentName;
    
     return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]isEqualToString:@"DetailCell"])
    {
       DetailsTableViewController  *section2 = [segue destinationViewController];
        NSIndexPath *selectedIndexPath =[self.tableView indexPathForSelectedRow];
        section2.studentDetails=[studentDetails objectAtIndex:selectedIndexPath.row];
    }
}
@end
