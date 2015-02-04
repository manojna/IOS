//
//  Transactions.h
//  CoreDataTask
//
//  Created by Paradigm on 9/26/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Employee;

@interface Transactions : NSManagedObject

@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSSet *empTransactions;
@end

@interface Transactions (CoreDataGeneratedAccessors)

- (void)addEmpTransactionsObject:(Employee *)value;
- (void)removeEmpTransactionsObject:(Employee *)value;
- (void)addEmpTransactions:(NSSet *)values;
- (void)removeEmpTransactions:(NSSet *)values;

@end
