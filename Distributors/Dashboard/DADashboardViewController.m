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
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "DADownlineProgressViewController.h"

@interface DADashboardViewController(){
    
}

@property (nonatomic, strong) UIBarButtonItem *progressBtnItem;

@end

@implementation DADashboardViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_LEADER_DASHBOARD]];
        [self.config setCellCls:[DADashboardChartCell class] inSection:0];
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setRightBarButtonItem:self.progressBtnItem];
}

#pragma mark - interactive ops

- (void)didTapProgress:(id)sender{
    DADownlineProgressViewController *vc = [DADownlineProgressViewController instance];
    [self pushViewController:vc];
}

#pragma mark - datasource

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value;
    NSInteger idx = indexPath.row;
    
    if (idx == 0) {
        value = @"No. of person connected with me";
    }else{
        value = @"No. of persons completed all tasks";
    }
    
    
    return value;
}

#pragma mark - components

- (UIBarButtonItem *)progressBtnItem{
    if (!_progressBtnItem) {
        _progressBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"Progress" style:UIBarButtonItemStylePlain target:self action:@selector(didTapProgress:)];
    }
    return _progressBtnItem;
}

@end
