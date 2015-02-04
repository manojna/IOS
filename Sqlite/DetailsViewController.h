//
//  DetailsViewController.h
//  Sqlite
//
//  Created by Paradigm on 9/22/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@protocol SubmitProtocol <NSObject>

@required

-(void)submitClicked:(NSString *)nameText secondParameter:(NSString *)designationText thirdParameter:(NSString *)ageText;

@end


@interface DetailsViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,strong)id<SubmitProtocol>Delegate;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *designation;
@property (weak, nonatomic) IBOutlet UITextField *age;

- (IBAction)onSubmit:(id)sender;




@end
