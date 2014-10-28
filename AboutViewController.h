//
//  AboutViewController.h
//  Jsonassignment
//
//  Created by Paradigm on 9/18/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonTableViewController.h"
#import "AboutObject.h"

@interface AboutViewController : UIViewController


@property(nonatomic,strong)AboutObject *aboutObject;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
