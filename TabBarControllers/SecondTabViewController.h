//
//  SecondTabViewController.h
//  TabBarControllers
//
//  Created by Paradigm on 9/9/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondTabViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table2;

@end
