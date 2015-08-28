//
//  DATaskDashboardViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskReportViewController.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "DADashboardChartCell.h"
#import "DAStyleDefine.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGCircleProgressCell.h"
#import "DATaskCircleChartCell.h"
//#import "AGTextCell.h"

typedef NS_ENUM(NSInteger, Section) {
//    SectionSummary,
    SectionLog,
    SectionProgress,
    SectionCount
};

@implementation DATaskReportViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_TASK_REPORT]];
        
//        [self.config setCellTitle:@"Products Sold/Bought" atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionSummary]];
//        [self.config setCellCls:[AGTextCell class] inSection:SectionSummary];
        
        [self.config setCellCls:[DADashboardChartCell class] inSection:SectionLog];
        [self.config setCellCls:[DATaskCircleChartCell class] inSection:SectionProgress];
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        [self enableSeparators];
    }
    return self;
}



#pragma mark - datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value;
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
//    if (section == SectionSummary) {
//        value = @21;
//    }
    
    if (section == SectionLog) {
        value = @"Products Sold/Bought Total:     21";
    }
    
    if (section == SectionProgress) {
//        value = @"No. of persons completed all tasks";
        value = [NSNumber numberWithFloat:.6];
    }
    
    
    return value;
}


@end
