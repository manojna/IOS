//
//  NSString+StringCategory.m
//  Jsonassignment
//
//  Created by Paradigm on 9/18/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "NSString+StringCategory.h"

@implementation NSString (StringCategory)
-(CGSize)stringSize:(NSString *)aboutString secondParameter:(UILabel *)label
{
    CGRect expectedSizeOfLabel = [aboutString boundingRectWithSize:CGSizeMake(100,FLT_MAX)
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:150]}
                                                          context:nil];
    return expectedSizeOfLabel.size;
}

-(CGRect)labelSize:(UILabel *)label secondParameter:(CGSize)expectedsizeOfString{
    
    CGRect labelFrame = label.frame;
    labelFrame.size.height = expectedsizeOfString.height;
    return labelFrame;
    
}



@end
