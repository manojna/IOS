//
//  DetailsTableViewController.h
//  School
//
//  Created by Paradigm on 9/17/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsObject.h"
#import "StudentObject.h"

@interface DetailsTableViewController : UITableViewController

@property(nonatomic,strong)StudentObject *studentDetails;
@end
