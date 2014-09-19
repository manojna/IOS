//
//  SectionDetails.h
//  School
//
//  Created by Paradigm on 9/16/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassDetails.h"

@interface SectionDetails : NSObject

@property(nonatomic,strong)NSString *secName;
@property(nonatomic,strong)NSString *className;

@property(nonatomic,strong)ClassDetails *studClass;
@property(nonatomic,strong)SectionDetails *studSection;
@property(nonatomic,assign)int studentsArray;

@end
