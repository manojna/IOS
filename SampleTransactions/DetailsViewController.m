//
//  DetailsViewController.m
//  SampleTransactions
//
//  Created by Paradigm on 9/17/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "DetailsViewController.h"
#import "TransactionTableViewController.h"
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_numberText resignFirstResponder];
    return YES;
}

- (IBAction)DoneAction:(id)sender {
    
    [self.delegate backClicked:[NSString stringWithFormat:@"Amount : %@", self.numberText.text] secondParameter:[NSString stringWithFormat:@"Description : %@", self.desText.text]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
