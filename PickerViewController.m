//
//  PickerViewController.m
//  Pickerview
//
//  Created by Paradigm on 9/10/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController
NSArray *array;
NSArray *apArray;
NSArray *tArray;
NSArray *vArray;
NSArray *sArray;
NSArray *kArray;
NSArray *wArray;
NSArray *hArray;
NSArray *kaArray;
int val;
int val2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    array = [[NSArray alloc]initWithObjects:@"AP",@"TELEN", nil];
    apArray = [[NSArray alloc]initWithObjects:@"Vizag",@"Srikakulam",@"Karnool", nil];
    tArray = [[NSArray alloc]initWithObjects:@"Warangal",@"Hyd",@"khammam", nil];
    vArray = [[NSArray alloc]initWithObjects:@"aruku",@"Anakapalli",@"tuni", nil];
    sArray = [[NSArray alloc]initWithObjects:@"Narasanapeta",@"Rajam",@"Palasa", nil];
    kArray = [[NSArray alloc]initWithObjects:@"Nandhyala",@"Allipuram",@"Tirupathi", nil];
    wArray = [[NSArray alloc]initWithObjects:@"Hanumakonda",@"Temple",@"Balaga", nil];
    hArray = [[NSArray alloc]initWithObjects:@"Kukatpally",@"Begampet",@"Gachibawly", nil];
    kaArray = [[NSArray alloc]initWithObjects:@"Adilabad",@"Hanumakonda",@"Golkonda", nil];

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch(component)
    {
        case 0:return 2;
            break;
        case 1:return 4;
            break;
        case 2:return 4;
            break;
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString  *title;
    if(component==0)
    {
        switch (row) {
            case 0:title=[array objectAtIndex:0];
                break;
            case 1:title=[array objectAtIndex:1];
                break;
        }
    }
    else if(component==1)
    {
        if(val==1)
        {
            switch (row) {
                case 0:title=[apArray objectAtIndex:0];
                    break;
                case 1:title=[apArray objectAtIndex:1];
                    break;
                case 2:title=[apArray objectAtIndex:2];
                    break;
            }
        }
        else if(val==2)
        {
            switch (row) {
                case 0:title=[tArray objectAtIndex:0];
                    break;
                case 1:title=[tArray objectAtIndex:1];
                    break;
                case 2:title=[tArray objectAtIndex:2];
                    break;
            }
        }
    }
    
    else if(component==2)
    {
        switch (val)
        {
            case 1:
            {
                if(val2==1)
                {
                    switch (row) {
                        case 0:title=[vArray objectAtIndex:0];
                            break;
                        case 1:title=[vArray objectAtIndex:1];
                            break;
                        case 2:title=[vArray objectAtIndex:2];
                            break;
                    }
                }
                if(val2==2)
                {
                    switch (row) {
                        case 0:title=[sArray objectAtIndex:0];
                            break;
                        case 1:title=[sArray objectAtIndex:1];
                            break;
                        case 2:title=[sArray objectAtIndex:2];
                            break;
                    }
                }
                else if(val2==3)
                {
                    switch (row) {
                        case 0:title=[kArray objectAtIndex:0];
                            break;
                        case 1:title=[kArray objectAtIndex:1];
                            break;
                        case 2:title=[kArray objectAtIndex:2];
                            break;
                    }
                    
                }
                            }
                break;
            case 2:
            {
                if(val2==1)
                {
                    switch (row) {
                        case 0:title=[wArray objectAtIndex:0];
                            break;
                        case 1:title=[wArray objectAtIndex:1];
                            break;
                        case 2:title=[wArray objectAtIndex:2];
                            break;
                    }
                }
                if(val2==2)
                {
                    switch (row) {
                        case 0:title=[hArray objectAtIndex:0];
                            break;
                        case 1:title=[hArray objectAtIndex:1];
                            break;
                        case 2:title=[hArray objectAtIndex:2];
                            break;
                    }
                }
                else if(val2==3)
                {
                    switch (row) {
                        case 0:title=[kaArray objectAtIndex:0];
                            break;
                        case 1:title=[kaArray objectAtIndex:1];
                            break;
                        case 2:title=[kaArray objectAtIndex:2];
                            break;
                    }
                    
                }


            }
                break;
            default:
                break;
        }

        
        
        
        
    }
    return title;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        if(row==0)
        {
            val=1;
            [pickerView reloadAllComponents];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
        else
        {
            val=2;
            [pickerView reloadAllComponents];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView selectRow:0 inComponent:2 animated:YES];

        }
    }
    else if(component==1)
    {
        if( row==0 )
        {
            val2=1;
            
            [pickerView reloadAllComponents];
        }
        
        else if(row==1)
        {
            val2=2;
            [pickerView reloadAllComponents];
        }
        else if(row==2)
        {
            val2=3;
            [pickerView reloadAllComponents];
        }
        
    }
}

@end
