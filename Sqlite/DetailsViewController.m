//
//  DetailsViewController.m
//  Sqlite
//
//  Created by Paradigm on 9/22/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "DetailsViewController.h"
#import "EmployeeTableViewController.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onSubmit:(id)sender {
    
    [self.Delegate submitClicked:[NSString stringWithFormat:@"%@",self.name.text] secondParameter:[NSString stringWithFormat:@"%@",self.designation.text] thirdParameter:[NSString stringWithFormat:@"%@",self.age.text]];
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
