//
//  TransactionTableViewController.m
//  CoreDataAssignment
//
//  Created by pcs20 on 9/25/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import "TransactionTableViewController.h"
#import "Transactions.h"

@interface TransactionTableViewController ()

@end

@implementation TransactionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fetchResultControllers=[self goToFetchedResultsController];
    NSError *error;
    [_fetchResultControllers performFetch:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([[_fetchResultControllers sections]count]>0) {
        return [[_fetchResultControllers sections] count];
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo=[[_fetchResultControllers sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transactioncell" forIndexPath:indexPath];
    Transactions *transactions=[_fetchResultControllers objectAtIndexPath:indexPath];
    cell.textLabel.text=transactions.desc;
    cell.detailTextLabel.text=[transactions.amount stringValue];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

-(NSFetchedResultsController *)goToFetchedResultsController{
    
    if (_fetchResultControllers!=nil) {
        return _fetchResultControllers;
    }
    
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Transactions" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescript=[[NSSortDescriptor alloc]initWithKey:@"amount" ascending:YES];
    NSArray *descriptArray=[[NSArray alloc] initWithObjects:sortDescript, nil];
    [fetchRequest setSortDescriptors:descriptArray];
     NSPredicate *predicate=[NSPredicate predicateWithFormat:@"empTransactions==%@",_selectedEmployee];
     [fetchRequest setPredicate:predicate];
    NSFetchedResultsController *fetchedResultsContrl=[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:_managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    _fetchResultControllers = fetchedResultsContrl;
    _fetchResultControllers.delegate=self;
    return _fetchResultControllers;
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{

    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        case NSFetchedResultsChangeUpdate:
            if (newIndexPath==nil) {
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationNone];
            }
            else{
                
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
                
                [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
            
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    
    [self.tableView endUpdates];
}
- (IBAction)addtransaction:(id)sender {
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Add Transaction" message:@"Enter Transaction details" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    alert.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
    UITextField *amountField=[alert textFieldAtIndex:1];
    amountField.secureTextEntry=NO;
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        Transactions *transact=[NSEntityDescription insertNewObjectForEntityForName:@"Transactions" inManagedObjectContext:_managedObjectContext];
        transact.desc=[alertView textFieldAtIndex:0].text;
        transact.amount=[NSNumber numberWithInt:[[alertView textFieldAtIndex:1].text intValue]];
        transact.empTransactions=_selectedEmployee;
        NSError *error;
        [_managedObjectContext save:&error];
    }
}

@end
