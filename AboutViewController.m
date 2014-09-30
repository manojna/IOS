//
//  AboutViewController.m
//  Jsonassignment
//
//  Created by Paradigm on 9/18/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "AboutViewController.h"
#import "NSString+StringCategory.h"


@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
    NSString *aboutString=_aboutObject.aboutText;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 200, 100)];
    label.text=aboutString;
    
    CGSize expectedSizeOfString = [aboutString stringSize:@"aboutString" secondParameter:label];
    label.frame=[aboutString labelSize:label secondParameter:expectedSizeOfString];
    _scrollView.contentSize=CGSizeMake(50, label.frame.size.height);
    
    label.numberOfLines=0;
    [label sizeToFit];
    [self.scrollView addSubview:label];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
