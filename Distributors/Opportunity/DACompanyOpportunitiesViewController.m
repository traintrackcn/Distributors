//
//  DAOpportunitiesViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACompanyOpportunitiesViewController.h"
#import "AGTextCell.h"
#import "AGViewController+Datasource.h"
#import "DAOpportunityViewController.h"
#import "GlobalDefine.h"
#import "AGTextCoordinator.h"
#import "NSObject+Singleton.h"
#import "DATextDefine.h"
#import "DADefine.h"
#import "RootViewController.h"
#import "RootTabController.h"
#import "DALeaderOpportunityCell.h"
#import "AGSearchCell.h"
//#import "DACompanyPicker.h"
#import "DAOpportunityTemplateEditor.h"
#import "DAOpportunityDataset.h"
#import "DACompany.h"
#import "DANewOpportunityCell.h"
#import "DAStyleDefine.h"
#import "DATasksEditor.h"
#import "DAOpportunityCoordinator.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSearch,
    SectionItem,
    SectionNewOpportunity,
    SectionCount
};

@interface DACompanyOpportunitiesViewController(){
    
}

@property (nonatomic, strong) UIView *segmentControlContainer;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIBarButtonItem *addButtonItem;

@end

@implementation DACompanyOpportunitiesViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self.config setCellCls:[DANewOpportunityCell class] inSection:SectionNewOpportunity];
        [self.config setCellCls:[AGSearchCell class] inSection:SectionSearch];
        [self.config setCellCls:[DALeaderOpportunityCell class] inSection:SectionItem];
//        [self.config setCellCls:[AGTextCell class] inSection:SectionLeader];
//        [self assembleTabBar];
        [self setTitle:@"OG"];
        
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        
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

#pragma mark - interactive ops

- (void)didTapAdd:(id)sender{
    [self presentTemplateEditor];
}


- (void)presentTemplateEditor{
    [[DAOpportunityDataset singleton] requestTemplatesByCompany:self.item completion:^(NSArray *templates) {
        TLOG(@"templates -> %@", templates);
//        DAOpportunityTemplateEditor *vc = [DAOpportunityTemplateEditor instance];
//        [vc setCompany:self.item];
//        [vc setItem:templates.firstObject];
        
        DATasksEditor *vc = [DATasksEditor instance];
        [vc setItem:[DAOpportunityCoordinator singleton].opportunityInstance];
        
        DANavigationController *naviC = [[DANavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:naviC animated:YES completion:^{
            
        }];
    }];
}

#pragma mark - components

- (UIBarButtonItem *)addButtonItem{
    if (!_addButtonItem) {
        _addButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconAdd"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapAdd:)];
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
    if (section == SectionSearch && [self isSectionSearchAvailable]) return 1;
    if (section == SectionItem && [self isSectionItemAvailable]) return self.itemCount;
    if (section == SectionNewOpportunity && [self isSectionNewOpportunityAvailable]) return 1;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value = [super valueAtIndexPath:indexPath];
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    NSArray *letters = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"O", @"P", @"Q", @"R", @"S", @"T"];
    NSString *letter = [letters objectAtIndex:idx];
    
    if (section == SectionItem) {
        value = [NSString stringWithFormat:@"Opportunity %@", letter];
    }
    
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DAOpportunityViewController *vc = [DAOpportunityViewController instance];
    TLOG(@"self.naviC -> %@", self.navigationController);
    [vc setItem:[DAOpportunityDataset singleton].demoOpportunity];
    [self pushViewController:vc];
}


//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I"];
//}

#pragma mark - section

- (BOOL)isSectionNewOpportunityAvailable{
    return self.itemCount == 0?YES:NO;
}

- (BOOL)isSectionSearchAvailable{
    return ![self isSectionNewOpportunityAvailable];
}

- (BOOL)isSectionItemAvailable{
    return ![self isSectionNewOpportunityAvailable];
}

#pragma mark - cell delegate

- (void)cellRequestAction:(id)action atIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    
    if (section == SectionNewOpportunity) {
//        self.itemCount = 10;
//        [self reloadVisibleIndexPaths];
        [self presentTemplateEditor];
    }
}

#pragma mark - styles

- (CGFloat)segmentControlW{
    return 200.0;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
