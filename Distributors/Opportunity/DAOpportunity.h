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

@interface DAOpportunity : AGModel

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *steps;

@property (nonatomic, strong) DACompany *company;
@property (nonatomic, strong) DAUser *owner;

@end
