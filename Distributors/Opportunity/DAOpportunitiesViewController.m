//
//  DAOpportunitiesViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunitiesViewController.h"
#import "AGTextCell.h"
#import "AGViewController+Datasource.h"
#import "DAOpportunityViewController.h"
#import "GlobalDefine.h"
#import "AGTextCoordinator.h"
#import "NSObject+Singleton.h"
#import "DATextKeyDefine.h"
#import "DADefine.h"
#import "RootViewController.h"
#import "RootTabController.h"
#import "DAOpportunityCell.h"
#import "AGSearchCell.h"
#import "DACompanyPicker.h"
#import "DAOpportunityDataset.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSearch,
    SectionItem,
    SectionCount
};

@interface DAOpportunitiesViewController(){
    
}

@property (nonatomic, strong) UIView *segmentControlContainer;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIBarButtonItem *addButtonItem;

@end

@implementation DAOpportunitiesViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self.config setCellCls:[AGSearchCell class] inSection:SectionSearch];
        [self.config setCellCls:[DAOpportunityCell class] inSection:SectionItem];
//        [self.config setCellCls:[AGTextCell class] inSection:SectionLeader];
//        [self assembleTabBar];
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY]];
        
            }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
//    [self.segmentControlContainer addSubview:self.segmentControl];
//    [self.parentViewController.navigationItem setTitleView:self.segmentControlContainer];
    
//    TLOG(@"self.navigationItem -> %@", self.navigationItem);
//    [self.parentViewController setTitle:[AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITIES]];
    [self.navigationItem setRightBarButtonItem:self.addButtonItem];

}

//- (void)assembleTabBar{
//    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY];
//    UIImage *img = [[UIImage alloc] init];
//    NSInteger tag = DARootTabIdxOpportunity;
//    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img tag:tag];
//    [self setTabBarItem:tabBarItem];
//}

#pragma mark - interactive ops

- (void)didTapAdd:(id)sender{
    DACompanyPicker *vc = [DACompanyPicker instance];
//    [self pushViewController:vc];
    UINavigationController *naviC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:naviC animated:YES completion:^{
        
    }];
}


#pragma mark - components

- (UIBarButtonItem *)addButtonItem{
    if (!_addButtonItem) {
        _addButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(didTapAdd:)];
    }
    return _addButtonItem;
}

- (UIView *)segmentControlContainer{
    if (!_segmentControlContainer) {
        _segmentControlContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.segmentControlW, 44.0)];
        
    }
    return _segmentControlContainer;
}

- (UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
        NSString *lblOpportunities = [AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITIES];
        NSString *lblLeaders = [AGTextCoordinator textForKey:KEY_LBL_LEADERS];
        CGFloat w = self.segmentControlW;
        CGFloat h = 24.0;
        CGFloat y = (self.segmentControlContainer.frame.size.height - h)/2.0;
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[lblOpportunities, lblLeaders]];
        [_segmentControl addTarget:self action:@selector(didTapSegmentControl:) forControlEvents:UIControlEventValueChanged];
        [_segmentControl setFrame:CGRectMake(0, y, w, h)];
    }
    return _segmentControl;
}

#pragma mark - interactive ops

- (void)didTapSegmentControl:(id)sender{
    TLOG(@"sender -> %@", sender);
}

#pragma mark - table view data

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionSearch) return 1;
    if (section == SectionItem) return 10;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    id value = [NSString stringWithFormat:@"Opportunity-%ld", (long)idx];
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DAOpportunityViewController *vc = [DAOpportunityViewController instance];
    TLOG(@"self.naviC -> %@", self.navigationController);
    [vc setItem:[DAOpportunityDataset singleton].demoOpportunity];
    [self pushViewController:vc];
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I"];
}

#pragma mark - styles

- (CGFloat)segmentControlW{
    return 200.0;
}


@end
