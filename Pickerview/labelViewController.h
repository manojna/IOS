//
//  labelViewController.h
//  TabBarControllers
//
//  Created by Paradigm on 9/9/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface labelViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UIImageView *image1;


@property(nonatomic,strong)NSNumber *viewControllernum;
@property(nonatomic,strong)UIImageView *imageView;



@end
