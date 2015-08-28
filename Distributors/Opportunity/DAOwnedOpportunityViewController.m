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
#import "AGButtonItem.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "DADashboardViewController.h"
#import "DATaskCellStyleProgress.h"
#import "DAStep.h"
//#import "DATaskProgressEditor.h"
#import "DAStepHeaderView.h"
#import "DATaskViewController.h"
#import "DAOpportunityTitleCell.h"

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
    
    [self.config setCellCls:[DAOpportunityTitleCell class] inSection:self.SectionTitle];
    
    for (NSInteger section = 1; section < self.SectionCount; section ++) {
        [self.config setHeaderCls:[DAStepHeaderView class] forSection:section];
        [self.config setCellCls:[DATaskCellStyleProgress class] inSection:section];
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

- (NSInteger)SectionTitle{
    return 0;
}

- (NSInteger)SectionFirstStep{
    return 1;
}

- (NSInteger)SectionLastStep{
    return self.item.steps.count;
}

- (NSInteger)SectionCount{
    return self.SectionLastStep + 1;
}

- (NSInteger)stepIndexOfSection:(NSInteger)section{
    return section - 1;
}

- (NSInteger)numberOfSections{
    return self.SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    
    if (section == self.SectionTitle) return 1;
    DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
    return step.tasks.count;
//    return [super numberOfRowsInSection:section];
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == self.SectionTitle) return value;
    
    DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
    value = [step.tasks objectAtIndex:idx];
    
    return value;
}

- (id)valueForHeaderOfSection:(NSInteger)section{
    
    id value;
    
    if (section != self.SectionTitle) {
        DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
        value = @[
                  [NSString stringWithFormat:@"%ld", ([self stepIndexOfSection:section] + 1)],
                    [NSString stringWithFormat:@"%@", step.name]
                  ];
    }
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
    DATask *item = [step.tasks objectAtIndex:idx];
    DATaskViewController *vc = [DATaskViewController instance];
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
