//
//  DAOpportunity.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"

@class DACompany;
@class DAUser;
@class DAEarningPotential;

@interface DAOpportunity : AGModel

- (NSArray *)tasksOngoing;
- (NSArray *)tasksCompleted;

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSArray *tasks;

@property (nonatomic, strong) DACompany *company;
@property (nonatomic, strong) DAUser *owner;

@property (nonatomic, strong) DAEarningPotential *earningPotential;

@end
