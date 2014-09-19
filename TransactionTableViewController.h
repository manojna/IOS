//
//  TransactionTableViewController.h
//  SampleTransactions
//
//  Created by Paradigm on 9/17/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

@interface TransactionTableViewController : UITableViewController<DoneProtocol>
-(void)backClicked:(NSString *)amountText secondParameter:(NSString *)descriptionText;

@end
