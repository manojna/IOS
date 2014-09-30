//
//  LabelViewController.h
//  School
//
//  Created by Paradigm on 9/16/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassDetails.h"
#import "SectionDetails.h"

@interface LabelViewController : UIViewController
@property(nonatomic,weak)IBOutlet UILabel *label;
@property(nonatomic,weak)IBOutlet UILabel *label1;
@property(nonatomic,weak)IBOutlet UILabel *label2;


@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *className;
@property(nonatomic,strong)NSString *secName;

@end
