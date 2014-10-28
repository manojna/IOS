//
//  SectionTableViewController.h
//  School
//
//  Created by Paradigm on 9/16/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassDetails.h"
#import "StudentObject.h"

@interface SectionTableViewController : UITableViewController


@property(nonatomic,strong)ClassDetails *classRef;
@end
