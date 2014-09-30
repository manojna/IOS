//
//  SectionTableViewController.m
//  School
//
//  Created by Paradigm on 9/16/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "SectionTableViewController.h"
#import "ClassDetails.h"
#import "FirstTableViewController.h"
#import "SectionDetails.h"
#import "StudentTableViewController.h"

@interface SectionTableViewController (){
    NSMutableArray *sectionsArray;
}

@end

@implementation SectionTableViewController

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
    
    self.title = _classRef.className;
    
    sectionsArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i<_classRef.numberOfSections; i++) {
        SectionDetails *secObj = [[SectionDetails alloc]init];
        secObj.studentsArray = 5;
        secObj.studClass = _classRef;
        secObj.secName = [NSString stringWithFormat:@"Section %d",i];
        [sectionsArray addObject:secObj];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return sectionsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sectioncell"];
    SectionDetails *temp = [sectionsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = temp.secName;
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"thirdcell"])
    {
        StudentTableViewController  *section = [segue destinationViewController];
       NSIndexPath *selectedIndex=[self.tableView indexPathForSelectedRow];
       section.secRef=[sectionsArray objectAtIndex:selectedIndex.row];
       NSLog(@"%d",selectedIndex.row);
    }
}


@end
