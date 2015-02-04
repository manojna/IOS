//
//  ViewController.m
//  sample.gis
//
//  Created by Paradigm on 2/4/15.
//  Copyright (c) 2015 paradigmcreatives. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
//
//    if (array) {
//        int x=0;
//        int count=0;
//        NSArray *arrayEvents = array;
//        repeatedArray = [[NSMutableArray alloc] init];
//        NSMutableArray *repeatedCountArray = [[NSMutableArray alloc] init];
//        NSMutableArray *noDupllicatesArray = [[NSMutableArray alloc] init];
//        NSMutableArray *beginTime = [[NSMutableArray alloc]init] ;
//        NSMutableArray *endTime= [[NSMutableArray alloc]init] ;
//        NSMutableArray *indexes=[[NSMutableArray alloc] init];
//        int index=0;
//         for (FFEvent *event in array) {
//
//             if([beginTime containsObject:event.dateTimeBegin] && [endTime containsObject:event.dateTimeEnd]){
//
//             }
//             else
//             {
//                 [beginTime addObject:event.dateTimeBegin];
//                 [endTime addObject:event.dateTimeEnd];
//                 [indexes addObject:[NSNumber numberWithInt:index]];
//             }
//             index++;
//         }
//        for (NSNumber *selectedIndex in indexes) {
//            [noDupllicatesArray addObject:[array objectAtIndex:[selectedIndex integerValue]]];
//        }
//
//        for (FFEvent *event in noDupllicatesArray) {
//            count = 0;
//            FFEvent *nextEvent;
//            int checkEvent = 1;
//            for(int i=0;i<[arrayEvents count];i++)
//            {
//            if([arrayEvents count]>i)
//            {
//                nextEvent = [arrayEvents objectAtIndex:i];
//            }
//            if([arrayEvents count]== 1)
//            {
//                checkEvent = 0;
//            }
//            CGFloat yTimeBegin;
//            CGFloat yTimeEnd;
//            FFBlueButton *_labelbutton;
//
//            for (FFHourAndMinLabel *label in arrayLabelsHourAndMin) {
//                NSDateComponents *compLabel = [NSDate componentsOfDate:label.dateHourAndMin];
//                NSDateComponents *compEventBegin = [NSDate componentsOfDate:event.dateTimeBegin];
//                NSDateComponents *compEventEnd = [NSDate componentsOfDate:event.dateTimeEnd];
//
//                if (compLabel.hour == compEventBegin.hour && compLabel.minute <= compEventBegin.minute && compEventBegin.minute < compLabel.minute+MINUTES_PER_LABEL) {
//                    yTimeBegin = label.frame.origin.y+label.frame.size.height/2;
//                }
//                if (compLabel.hour == compEventEnd.hour && compLabel.minute <= compEventEnd.minute && compEventEnd.minute < compLabel.minute+MINUTES_PER_LABEL) {
//                    yTimeEnd = label.frame.origin.y+label.frame.size.height/2;
//                }
//
//            }
//            if((nextEvent != nil) && (checkEvent != 0) && ([[self getCorrectTimeformdate:event.dateTimeBegin] isEqualToString:[self getCorrectTimeformdate:nextEvent.dateTimeBegin]]) && ([[self getCorrectTimeformdate:event.dateTimeEnd] isEqualToString:[self getCorrectTimeformdate:nextEvent.dateTimeEnd]])){
//
//                FFBlueButton *_button = [[FFBlueButton alloc] initWithFrame:CGRectMake(x, yTimeBegin,self.frame.size.width-95, yTimeEnd-yTimeBegin)];
//                [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//                [_button setBackgroundColor:[UIColor colorWithRed:179./255. green:255./255. blue:255./255. alpha:0.5]];
//                [_button setTitle:[NSString stringWithFormat:@"%@ %@",@"JobID", event.stringCustomerName] forState:UIControlStateNormal];
//                [_button setEvent:event];
//                [arrayButtonsEvents addObject:_button];
//                [self addSubview:_button];
//
//                view = [[UIView alloc] initWithFrame:CGRectMake(_button.frame.origin.x-2, _button.frame.origin.y, 2.0f, _button.frame.size.height)];
//                [view setBackgroundColor:[UIColor colorWithRed:28./255. green:195./255. blue:255./255. alpha:5.0]];
//
//                [self addSubview:view];
//
//                if(([[self getCorrectTimeformdate:event.dateTimeBegin] isEqualToString:[self getCorrectTimeformdate:nextEvent.dateTimeBegin]]) || ([[self getCorrectTimeformdate:event.dateTimeEnd] isEqualToString:[self getCorrectTimeformdate:nextEvent.dateTimeEnd]])){
//                    count ++;
//                    [eventsArray addObject:event];
//                    int yLength;
//                    if(count >1){
//                        yLength = yTimeEnd;
//                        _labelbutton = [[FFBlueButton alloc] initWithFrame:CGRectMake(40, yTimeEnd, self.frame.size.width-88, 15)];
//                        [_labelbutton setBackgroundColor:[UIColor  clearColor]];
//                        [_labelbutton.titleLabel setFont:[GISFonts smallBold]];
//                        [_labelbutton.titleLabel setTextColor:[UIColor blackColor]];
//                        [_labelbutton setEvent:event];
//                        [_button setHidden:TRUE];
//                        [view setHidden:TRUE];
//                        [repeatedCountArray addObject:_labelbutton];
//                      }
//                    if([repeatedCountArray count])
//                       [_labelbutton setTitle:@"" forState:UIControlStateNormal];
//
//
//                    if(event == [noDupllicatesArray objectAtIndex:[noDupllicatesArray count]-1])
//                    {
//                        _labelbutton = [[FFBlueButton alloc] initWithFrame:CGRectMake(40, yLength-25, self.frame.size.width-88, 15)];
//                        [_labelbutton setBackgroundColor:[UIColor  clearColor]];
//                        [_labelbutton.titleLabel setFont:[GISFonts smallBold]];
//                        [_labelbutton.titleLabel setTextColor:[UIColor blackColor]];
//                        [_labelbutton setEvent:event];
//                     [self addSubview:_labelbutton];
//                    }
//                    [_labelbutton setTitle:[NSString stringWithFormat:@"%d more",[repeatedCountArray count]] forState:UIControlStateNormal];
//                }
//            }
//            else if(((checkEvent == 0) && ([[self getCorrectTimeformdate:event.dateTimeBegin] isEqualToString:[self getCorrectTimeformdate:nextEvent.dateTimeBegin]])) && ([[self getCorrectTimeformdate:event.dateTimeEnd] isEqualToString:[self getCorrectTimeformdate:nextEvent.dateTimeEnd]])){
//
//                if(repeatedArray)
//                   [repeatedArray removeAllObjects];
//
//                FFBlueButton *_button = [[FFBlueButton alloc] initWithFrame:CGRectMake(0+i*12, yTimeBegin, self.frame.size.width, yTimeEnd-yTimeBegin)];
//                [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//                [_button setBackgroundColor:[UIColor colorWithRed:179./255. green:255./255. blue:255./255. alpha:0.5]];
//                [_button setTitle:[NSString stringWithFormat:@"%@ %@",@"JobID", event.stringCustomerName] forState:UIControlStateNormal];
//                [_button setEvent:event];
//
//                [arrayButtonsEvents addObject:_button];
//                [eventsArray addObject:_button.event];
//                [self addSubview:_button];
//
//                view = [[UIView alloc] initWithFrame:CGRectMake(_button.frame.origin.x-2, _button.frame.origin.y, 2.0f, _button.frame.size.height)];
//                [view setBackgroundColor:[UIColor colorWithRed:28./255. green:195./255. blue:255./255. alpha:5.0]];
//
//                [self addSubview:view];
//
//                [self bringSubviewToFront:_button];
//            }
//          }
//            x = x+(self.frame.size.width-95);
//        }
//    }
