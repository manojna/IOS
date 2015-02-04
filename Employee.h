//
//  Employee.h
//  CoreDataTask
//
//  Created by Paradigm on 9/26/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Transactions;

@interface Employee : NSManagedObject

@property (nonatomic, retain) NSNumber * empId;
@property (nonatomic, retain) NSString * empName;
@property (nonatomic, retain) Transactions *employeeDetails;

@end
