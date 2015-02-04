//
//  FirstTableViewController.m
//  School
//
//  Created by Paradigm on 9/16/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "FirstTableViewController.h"
#import "ClassDetails.h"
#import "SectionTableViewController.h"


@interface FirstTableViewController ()
{
NSMutableArray *class;
}
@end

@implementation FirstTableViewController

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
    
    self.title=@"School";
    class = [[NSMutableArray alloc] init];


    for (int i=0;i<5;i++)
    {
        ClassDetails *classobj = [[ClassDetails alloc] init];
        classobj.className=[NSString stringWithFormat:@"Class %d",i];
        classobj.numberOfSections = 5;
        [class addObject:classobj];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[class count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstcell"];
    ClassDetails *temp = [class objectAtIndex:indexPath.row];
    cell.textLabel.text=temp.className;
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
    if ([[segue identifier]isEqualToString:@"secondcell"])
    {
        SectionTableViewController  *section = [segue destinationViewController];
        NSIndexPath *selectedIndex=[self.tableView indexPathForSelectedRow];
        section.classRef=[class objectAtIndex:selectedIndex.row];
    }
}


@end
