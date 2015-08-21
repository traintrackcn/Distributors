//
//  DAOpportunityStepSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityStepSection.h"
#import "DAOpportunityStepCell.h"
#import "AGVCConfiguration.h"
#import "DAOpportunityStep.h"
#import "DAOpportunity.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"

@implementation DAOpportunityStepSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        [self.config setCellCls:[DAOpportunityStepCell class] inSection:section];
    }
    return self;
}

- (id)valueAtIndex:(NSInteger)index{
    
    return [self.item.steps objectAtIndex:index];
}

- (NSInteger)numberOfRows{
    return self.item.steps.count;
}

- (id)headerValue{
    return [AGTextCoordinator textForKey:KEY_LBL_STEPS];
}

@end
