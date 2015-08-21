//
//  DAOpportunityTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTaskSection.h"
#import "AGVCConfiguration.h"
#import "DAOpportunityTaskCell.h"
#import "DAOpportunityStep.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"

@implementation DAOpportunityTaskSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        [self.config setCellCls:[DAOpportunityTaskCell class] inSection:section];
    }
    return self;
}

- (id)valueAtIndex:(NSInteger)index{
    return [self.item.tasks objectAtIndex:index];
}

- (NSInteger)numberOfRows{
    return self.item.tasks.count;
}

- (id)headerValue{
    return [AGTextCoordinator textForKey:KEY_LBL_TASKS];
}

@end
