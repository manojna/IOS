//
//  TabBarViewController.m
//  TabBarControllers
//
//  Created by Paradigm on 9/9/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "TabBarViewController.h"
#import "labelViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
NSArray *arrayData;

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
   arrayData = [[NSArray alloc] initWithObjects:@"Manogna",@"Vamsi",@"Shivajee",@"Ramana",@"Harikrishna",@"Anusha", nil];
    self.title = @"FirstTable";

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
     }
    cell.textLabel.text=[arrayData objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected Row: %d",indexPath.row);
    labelViewController *label = [[labelViewController alloc]initWithNibName:@"labelViewController" bundle:nil];
   
    switch(indexPath.row)
    {
            case 0:label.name=[arrayData objectAtIndex:0];
                   //label.backgroundColor = [UIColor lightGrayColor];
                   break;
            case 1:label.name=[arrayData objectAtIndex:1];
                    break;
            case 2:label.name=[arrayData objectAtIndex:2];
                    break;
            case 3:label.name=[arrayData objectAtIndex:3];
                    break;
            case 4:label.name=[arrayData objectAtIndex:4];
                   break;
            case 5:label.name=[arrayData objectAtIndex:5];
                   break;
            default:NSLog(@"No Acess");
                    break;
    }
     [self.navigationController pushViewController:label animated:YES];
}
@end
