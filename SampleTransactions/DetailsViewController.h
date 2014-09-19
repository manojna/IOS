//
//  DetailsViewController.h
//  SampleTransactions
//
//  Created by Paradigm on 9/17/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DoneProtocol <NSObject>

@required

-(void)backClicked:(NSString *)amountText secondParameter:(NSString *)descriptionText;

@end


@interface DetailsViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,strong)id<DoneProtocol>delegate;
- (IBAction)DoneAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UITextField *desText;

@end
