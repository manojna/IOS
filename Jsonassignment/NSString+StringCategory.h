//
//  NSString+StringCategory.h
//  Jsonassignment
//
//  Created by Paradigm on 9/18/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringCategory)
-(CGSize)stringSize:(NSString *)aboutString secondParameter:(UILabel *)label;
-(CGRect)labelSize:(UILabel *)label secondParameter:(CGSize)expectedsizeOfString;

@end
