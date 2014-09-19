//
//  TabBarViewController.h
//  TabBarControllers
//
//  Created by Paradigm on 9/9/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITabBar *tabController;
@property (weak, nonatomic) IBOutlet UITableView *table1;

@end
