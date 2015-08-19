//
//  DAEarningPotentialDataset.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAEarningPotentialDataset.h"
#import "DAEarningPotential.h"
#import "DADefine.h"
#import "DAPeriodDataset.h"
#import "NSObject+Singleton.h"

@implementation DAEarningPotentialDataset

- (instancetype)init{
    self = [super init];
    if (self) {
        [self declareDatasetIsArray];
        
        DAPeriod *periodItem = [DAPeriodDataset singleton].monthItem;
        
        [self.data addObject:[DAEarningPotential instanceWithMin:0 max:1000 period:periodItem]];
        [self.data addObject:[DAEarningPotential instanceWithMin:1001 max:3000 period:periodItem]];
        [self.data addObject:[DAEarningPotential instanceWithMin:3001 max:5000 period:periodItem]];
        [self.data addObject:[DAEarningPotential instanceWithMin:5001 max:10000 period:periodItem]];
    }
    return self;
}

- (DAEarningPotential *)defaultItem{
    return self.items.firstObject;
}

@end
