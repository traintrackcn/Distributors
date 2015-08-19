//
//  DAPeriodDataset.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAPeriodDataset.h"
#import "DAPeriod.h"
#import "DATextKeyDefine.h"
#import "AGTextCoordinator.h"

@implementation DAPeriodDataset

- (instancetype)init{
    self = [super init];
    if (self) {
        [self declareDatasetIsArray];
        [self.data addObject:[DAPeriod instanceWithName:[AGTextCoordinator textForKey:KEY_LBL_WEEK]]];
        [self.data addObject:[DAPeriod instanceWithName:[AGTextCoordinator textForKey:KEY_LBL_MONTH]]];
    }
    return self;
}

- (DAPeriod *)monthItem{
    return [self.items objectAtIndex:1];
}

- (DAPeriod *)weekItem{
    return [self.items objectAtIndex:0];
}

@end
