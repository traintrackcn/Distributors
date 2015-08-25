//
//  DAOpportunityProgressViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOwnedOpportunityViewController.h"
#import "DAOpportunity.h"
#import "AGTextCell.h"
#import "AGButtonCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAOpportunityDescriptionCell.h"
#import "DAOpportunityLeaderCell.h"
#import "DAStyleDefine.h"
#import "AGTextCellStyleTitleOnly.h"
#import "DAOpportunityStepSection.h"
#import "AGButtonItem.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "DADashboardViewController.h"
#import "DAOpportunityTaskProgressCell.h"
#import "DAOpportunityStep.h"
#import "DAOpportunityTaskProgressEditor.h"

@interface DAOwnedOpportunityViewController(){
    
}

//@property (nonatomic, strong) DAOpportunityStepSection *stepSection;
@property (nonatomic, strong) UIBarButtonItem *closeBtnItem;
@property (nonatomic, strong) UIBarButtonItem *dashboardBtnItem;

@end

@implementation DAOwnedOpportunityViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationItem setLeftBarButtonItem:self.closeBtnItem];
    [self.navigationItem setRightBarButtonItem:self.dashboardBtnItem];
}

- (void)configSections{
    
    for (NSInteger section = 0; section < self.SectionCount; section ++) {
        [self.config setCellCls:[DAOpportunityTaskProgressCell class] inSection:section];
    }
    
    [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    [self enableSeparators];
}

- (void)setItem:(DAOpportunity *)item{
    _item = item;
    [self setTitle:item.name];
    [self configSections];
}

#pragma mark - interactive ops

- (void)didTapStart:(id)sender{
    
}

- (void)didTapClose:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didTapDashboard:(id)sender{
    DADashboardViewController *vc = [DADashboardViewController instance];
    [self pushViewController:vc];
}

#pragma mark - 

- (NSInteger)SectionFirstStep{
    return 0;
}

- (NSInteger)SectionLastStep{
    return self.item.steps.count - 1;
}

- (NSInteger)SectionCount{
    return self.SectionLastStep + 1;
}

- (NSInteger)numberOfSections{
    return self.SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    DAOpportunityStep *step = [self.item.steps objectAtIndex:section];
    return step.tasks.count;
//    return [super numberOfRowsInSection:section];
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    DAOpportunityStep *step = [self.item.steps objectAtIndex:section];
    value = [step.tasks objectAtIndex:idx];
    
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    DAOpportunityStep *step = [self.item.steps objectAtIndex:section];
    DAOpportunityTask *item = [step.tasks objectAtIndex:idx];
    DAOpportunityTaskProgressEditor *vc = [DAOpportunityTaskProgressEditor instance];
    [vc setItem:item];
    [self pushViewController:vc];
}

#pragma mark - components

- (UIBarButtonItem *)closeBtnItem{
    if (!_closeBtnItem) {
        _closeBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(didTapClose:)];
    }
    return _closeBtnItem;
}

- (UIBarButtonItem *)dashboardBtnItem{
    if (!_dashboardBtnItem) {
        _dashboardBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconDashboard"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapDashboard:)];
    }
    return _dashboardBtnItem;
}


@end
