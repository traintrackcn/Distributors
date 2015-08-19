//
//  DAOpportunityEarningPotential.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"
#import "DADefine.h"

@class DACurrency;
@class DAPeriod;
@interface DAEarningPotential : AGModel

+ (instancetype)instanceWithMin:(float)min max:(float)max period:(DAPeriod *)period;

@property (nonatomic, strong) DAPeriod *period;
@property (nonatomic, assign) float min;
@property (nonatomic, assign) float max;
@property (nonatomic, assign) DACurrency *currency;

@end
