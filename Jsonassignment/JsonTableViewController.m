//
//  JsonTableViewController.m
//  Jsonassignment
//
//  Created by Paradigm on 9/18/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "JsonTableViewController.h"

@interface JsonTableViewController ()

@end

@implementation JsonTableViewController
NSMutableArray *compArray;
NSMutableArray *aboutArray;

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
   compArray=[[NSMutableArray alloc]init];
   aboutArray=[[NSMutableArray alloc]init];

    NSURL *jsonurl = [[NSBundle mainBundle] URLForResource:@"generated" withExtension:@"json"];
    NSError *error = nil;
    NSString *jsonString = [NSString stringWithContentsOfURL:jsonurl encoding:NSUTF8StringEncoding error:&error];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject=[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSArray *jArray= (NSArray *)jsonObject;
   
    for (NSDictionary *jDict in jArray){
        [compArray addObject:[jDict objectForKey:@"company"]];
        AboutObject *obj=[[AboutObject alloc] init];
        obj.aboutText=[jDict objectForKey:@"about"];
        [aboutArray addObject:obj];
   }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [compArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jsoncell" forIndexPath:indexPath];
    cell.textLabel.text = [compArray objectAtIndex:indexPath.row] ;
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"aboutcell"]){
        AboutViewController *about = [segue destinationViewController];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        about.aboutObject=[aboutArray objectAtIndex:selectedIndexPath.row];

    }
}


@end
