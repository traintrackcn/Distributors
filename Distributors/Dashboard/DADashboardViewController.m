//
//  DAOpportunityDashboardViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADashboardViewController.h"
#import "DADashboardChartCell.h"
#import "AGViewController+Datasource.h"
#import "DAStyleDefine.h"

@implementation DADashboardViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self.config setCellCls:[DADashboardChartCell class] inSection:0];
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    }
    return self;
}

#pragma mark - datasource

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value;
    return value;
}

@end
