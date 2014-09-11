//
//  STAppDelegate.h
//  TabBarControllers
//
//  Created by Paradigm on 9/9/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"

@interface STAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong) UITabBarController *tabbar;
@property(nonatomic,strong) UINavigationController *nav1,*nav2,*nav3,*nav4;


@end
