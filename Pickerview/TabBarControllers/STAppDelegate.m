//
//  STAppDelegate.m
//  TabBarControllers
//
//  Created by Paradigm on 9/9/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "STAppDelegate.h"
#import "SecondTabViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@implementation STAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    _tabbar =[[UITabBarController alloc]init];
    [self.window setRootViewController:_tabbar];
    TabBarViewController *first = [[TabBarViewController alloc] initWithNibName:@"TabBarViewController" bundle:nil];
    SecondTabViewController *second = [[SecondTabViewController alloc] initWithNibName:@"SecondTabViewController" bundle:nil];
    ThirdViewController *third =[[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    FourthViewController *four = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
    _nav1 = [[UINavigationController alloc] initWithRootViewController:first];
    _nav2 = [[UINavigationController alloc] initWithRootViewController:second];
    _nav3 = [[UINavigationController alloc] initWithRootViewController:third];
    _nav4 = [[UINavigationController alloc] initWithRootViewController:four];
    
     _nav1.tabBarItem.title = @"First";
     _nav2.tabBarItem.title = @"second";
     _nav3.tabBarItem.title = @"Third";
     _nav4.tabBarItem.title = @"Four";
    _nav1.tabBarItem.image = [UIImage imageNamed:@"man.png"];
    _nav2.tabBarItem.image = [UIImage imageNamed:@"photo1.png"];
    _nav3.tabBarItem.image = [UIImage imageNamed:@"music.png"];
    _nav4.tabBarItem.image = [UIImage imageNamed:@"pen.png"];
    
    _tabbar.viewControllers = [NSArray arrayWithObjects:_nav1,_nav2,_nav3,_nav4,nil];
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
