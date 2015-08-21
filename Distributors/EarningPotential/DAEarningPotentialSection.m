//
//  DAEarningPotentialSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAEarningPotentialSection.h"
#import "AGVCConfiguration.h"
#import "DAEarningPotentialCell.h"
#import "DAOpportunity.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"

@implementation DAEarningPotentialSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        [self.config setCellCls:[DAEarningPotentialCell class] inSection:self.section];
//        [self.config setCellCls:[] inSection:section];
    }
    return self;
}

- (id)valueAtIndex:(NSInteger)index{
    return self.item.earningPotential;
}

- (id)headerValue{
    return [AGTextCoordinator textForKey:KEY_LBL_EARNING_POTENTIAL];
}

@end
