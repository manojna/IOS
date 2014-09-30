//
//  Anotation.m
//  MapViews
//
//  Created by Paradigm on 9/11/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "Anotation.h"

@implementation Anotation
@synthesize coordinate=_coordinate;
@synthesize title=_title;
-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    _title = title;
    _coordinate = coordinate;
    return self;
}

@end
