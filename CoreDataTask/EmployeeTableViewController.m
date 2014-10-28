//
//  EmployeeTableViewController.m
//  CoreDataTask
//
//  Created by Paradigm on 9/25/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "EmployeeTableViewController.h"
#import "AppDelegate.h"
#import "Employee.h"
#import "TransactionTableViewController.h"
@interface EmployeeTableViewController (){

AppDelegate *appDelegate;

}

@end

@implementation EmployeeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    _managedObjectContext  = [appDelegate managedObjectContext];
    _fetchResultsController = [self goToFetchResultController];
    NSError *error = nil;
    [_fetchResultsController performFetch:&error];
   
}
#pragma Mark - FetchResultControllers Method
-(NSFetchedResultsController *)goToFetchResultController
{
 if(self.fetchResultsController!= nil)
 {
     return self.fetchResultsController;
 }
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"empName" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:sortDesc, nil];
    [fetchRequest setSortDescriptors:sortArray];
    
    
    NSFetchedResultsController *fetchResult = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:_managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    _fetchResultsController = fetchResult;
    _fetchResultsController.delegate = self;
    return self.fetchResultsController;
}
#pragma Mark - NSFetchResultControllersDelegates


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [_employeeTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [_employeeTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
         case NSFetchedResultsChangeUpdate:
            if(indexPath == nil)
            {
                [_employeeTable reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
            else
            {
               [_employeeTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [_employeeTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
            break;
        case NSFetchedResultsChangeMove:
            [_employeeTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [_employeeTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;

        default:
            break;
    }
}
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    
    [_employeeTable beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    
    [_employeeTable endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([[_fetchResultsController sections]count]>0) {
        return self.fetchResultsController.sections.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [[_fetchResultsController sections] objectAtIndex:section];
    return sectionInfo.numberOfObjects;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"employeecell" forIndexPath:indexPath];
    Employee *empDet = [_fetchResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text =empDet.empName;
    cell.detailTextLabel.text =[NSString stringWithFormat:@"%@",[empDet empId]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier]isEqualToString:@"goToTransaction"]){
        UINavigationController *navController=[segue destinationViewController];
        
        TransactionTableViewController *trans =[navController.viewControllers objectAtIndex:0];
       trans.managedObjectContext=_managedObjectContext;
        NSIndexPath *selectedindexpath =[self.tableView indexPathForSelectedRow];
       trans.selectedEmployee=[_fetchResultsController objectAtIndexPath:selectedindexpath];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        Employee *empDetails = [NSEntityDescription insertNewObjectForEntityForName:@"Employee"inManagedObjectContext:_managedObjectContext];
        empDetails.empName = [alertView textFieldAtIndex:0].text;
        empDetails.empId = [NSNumber numberWithInt:[[[alertView textFieldAtIndex:1] text] intValue]];
        NSError *error = nil;
        [_managedObjectContext save:&error];
        
    }
}

- (IBAction)addDetails:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"EmployeeDetails" message:@"Insert Details" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [[alertView textFieldAtIndex:1] setSecureTextEntry:NO];
    [alertView show];
    
}
@end
