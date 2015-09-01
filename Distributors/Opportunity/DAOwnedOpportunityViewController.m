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
#import "DAOpportunityDataset.h"
#import "DATaskReportViewController.h"
#import "DAOpportunityTitleCell.h"
#import "DATaskViewController.h"
#import "DATaskDefine.h"
#import "DATask.h"


typedef NS_ENUM(NSInteger, Section) {
    SectionSeparator,
    SectionCountdown,
    SectionTaskOngoing,
    SectionTaskCompleted,
    SectionCount
};

@interface DAOwnedOpportunityViewController(){
    
}

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
    
    [self.config setCellCls:[AGSeparatorCell class] inSection:SectionSeparator];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_COUNTDOWN] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionCountdown]];
    [self.config setCellCls:[AGTextCell class] inSection:SectionCountdown];

    [self.config setCellCls:[DATaskCellStyleProgress class] inSection:SectionTaskOngoing];
    
    [self.config setCellCls:[DATaskCellStyleProgress class] inSection:SectionTaskCompleted];

    
    [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    [self enableSeparators];
    [self.config removeSeparatorForSection:SectionCountdown];
    [self.config removeSeparatorForSection:SectionSeparator];
}

- (void)setItem:(DAOpportunity *)item{
    _item = item;
//    TLOG(@"item -> %@ %@", item, item.tasks);
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

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    
    if (section == SectionSeparator) return 1;
    if (section == SectionCountdown) return 1;
    if (section == SectionTaskOngoing) return self.item.tasksOngoing.count;
    if (section == SectionTaskCompleted) return self.item.tasksCompleted.count;
    
//    return [super numberOfRowsInSection:section];
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == SectionCountdown) {
        value = @"2 days 23 hours";
    }
    
    if (section == SectionTaskOngoing) {
        value = [self.item.tasksOngoing objectAtIndex:idx];
    }
    
    if (section == SectionTaskCompleted) {
        value = [self.item.tasksCompleted objectAtIndex:idx];
    }
    
    
    return value;
}

//- (id)valueForHeaderOfSection:(NSInteger)section{
//    
//    id value;
//    
//    if (section != self.SectionTitle) {
//        DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
//        value = @[
//                  [NSString stringWithFormat:@"%ld", ([self stepIndexOfSection:section] + 1)],
//                    [NSString stringWithFormat:@"%@", step.name]
//                  ];
//    }
//    return value;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    if (section == SectionTaskOngoing) {
        DATask *item = [self.item.tasksOngoing objectAtIndex:idx];
        [self pushNext:item];
    }
    
    
    if (section == SectionTaskCompleted) {
        DATask *item = [self.item.tasksCompleted objectAtIndex:idx];
        [self pushNext:item];
    }
    
}


#pragma mark - 

- (void)pushNext:(DATask *)item{
    DATaskType type = item.type;
    
    
    if (type == DATaskTypeTestimonial || type == DATaskTypeOthers) {
        [self pushDetail:item];
    }else{
        [self pushReport:item];
    }
    
}

- (void)pushReport:(DATask *)item{
    DATaskReportViewController *vc = [DATaskReportViewController instance];
    [vc setItem:item];
    [self pushViewController:vc];
}

- (void)pushDetail:(DATask *)item{
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
        _dashboardBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconLeaderDashboard"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapDashboard:)];
    }
    return _dashboardBtnItem;
}


@end
