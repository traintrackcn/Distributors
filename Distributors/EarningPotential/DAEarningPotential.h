//
//  DAOpportunityEarningPotential.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"

@interface DAEarningPotential : AGModel

@property (nonatomic, assign) NSInteger period;
@property (nonatomic, assign) CGFloat min;
@property (nonatomic, assign) CGFloat max;
@property (nonatomic, assign) NSInteger currency;

@end
