//
//  DATaskDashboardViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskProgressViewController.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "DADashboardChartCell.h"
#import "DAStyleDefine.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGCircleProgressCell.h"
#import "DATaskCircleChartCell.h"
#import "DATaskViewController.h"
#import "DATask.h"
#import "AGTextCell.h"
//#import "AGTextCell.h"

typedef NS_ENUM(NSInteger, Section) {
//    SectionSummary,
    SectionTest,
    SectionLine,
    SectionCircle,
    SectionCount
};

@interface DATaskProgressViewController(){
    
}

@property (nonatomic, strong) UIBarButtonItem *detailButtonItem;

@end

@implementation DATaskProgressViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_TASK_REPORT]];
        
//        [self.config setCellTitle:@"Products Sold/Bought" atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionSummary]];
        [self.config setCellCls:[AGTextCell class] inSection:SectionTest];
        
        [self.config setCellCls:[DADashboardChartCell class] inSection:SectionLine];
        [self.config setCellCls:[DATaskCircleChartCell class] inSection:SectionCircle];
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        [self enableSeparators];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationItem setRightBarButtonItem:self.detailButtonItem];
}

#pragma mark - interactive ops

- (void)didTapDetail:(id)sender{
    DATaskViewController *vc = [DATaskViewController instance];
    [vc setItem:self.item];
    [self pushViewController:vc];
}


#pragma mark - datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
//    if (section == SectionTest) return 1;
    if (section == SectionLine && [self isSectionLineAvailable]) return 1;
    if (section == SectionCircle && [self isSectionCircleAvailable]) return 1;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value;
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    if (section == SectionTest) {
        value = [NSString stringWithFormat:@"test %d %d item:%@ type:%d", [self isSectionLineAvailable], [self isSectionCircleAvailable], self.item, self.type];
    }
    
    if (section == SectionLine) {
        value = @"Products Sold/Bought Total:     21";
    }
    
    if (section == SectionCircle) {
//        value = @"No. of persons completed all tasks";
        value = [NSNumber numberWithFloat:self.item.progress];
    }
    
    
    return value;
}


- (BOOL)isSectionLineAvailable{
    if (self.type == DATaskTypeContacts) return YES;
    return NO;
}

- (BOOL)isSectionCircleAvailable{
    if (self.type == DATaskTypeTestimonial) return NO;
    if (self.type == DATaskTypeOthers) return NO;
    return YES;
}

#pragma mark - components

- (UIBarButtonItem *)detailButtonItem{
    if (!_detailButtonItem) {
        _detailButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Detail" style:UIBarButtonItemStylePlain target:self action:@selector(didTapDetail:)];
    }
    return _detailButtonItem;
}

#pragma mark - properties

- (DATaskType)type{
    return self.item.type;
}


@end
