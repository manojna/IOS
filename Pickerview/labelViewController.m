//
//  labelViewController.m
//  TabBarControllers
//
//  Created by Paradigm on 9/9/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "labelViewController.h"

@interface labelViewController ()

@end

@implementation labelViewController

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
    int x=[_viewControllernum integerValue];
    NSLog(@"Hello %d",x);
    if(x==2){
        _imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"manogna.jpg"]];
        _imageView.frame=CGRectMake(120, 320, 100, 100);
        [self.view addSubview:_imageView];
    
    }
    _label1.text=_name;
    
    _label1.backgroundColor = [UIColor greenColor];
    self.title=@"LabelString";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
