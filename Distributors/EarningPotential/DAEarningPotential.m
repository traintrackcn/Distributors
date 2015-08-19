//
//  DAOpportunityEarningPotential.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAEarningPotential.h"
#import "DACurrencyDataset.h"
#import "NSObject+Singleton.h"
#import "DAPeriod.h"


@implementation DAEarningPotential

+ (instancetype)instanceWithMin:(float)min max:(float)max period:(DAPeriod *)period{
    DAEarningPotential *instance = [DAEarningPotential instance];
    [instance setMax:max];
    [instance setMin:min];
    [instance setPeriod:period];
    [instance setCurrency:[DACurrencyDataset singleton].defaultItem];
    return instance;
}

@end
