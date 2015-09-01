//
//  DAOpportunitiesViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAGeneralOpportunitesViewController.h"
#import "AGTextCell.h"
#import "AGViewController+Datasource.h"
#import "DAOpportunityViewController.h"
#import "GlobalDefine.h"
#import "DATextDefine.h"
#import "DADefine.h"
#import "RootViewController.h"
#import "RootTabController.h"
#import "DACompanyOpportunityCell.h"
#import "DACompanyOpportunitiesViewController.h"
#import "DASearchCell.h"
//#import "DACompanyPicker.h"
#import "DAOpportunityDataset.h"
#import "DAStyleDefine.h"
#import "DAOpportunityBasicEditor.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSearch,
    SectionItem,
    SectionCount
};

@interface DAGeneralOpportunitesViewController(){
    
}

@property (nonatomic, strong) UIView *segmentControlContainer;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIBarButtonItem *addButtonItem;

@end

@implementation DAGeneralOpportunitesViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self.config setCellCls:[DASearchCell class] inSection:SectionSearch];
        [self.config setCellCls:[DACompanyOpportunityCell class] inSection:SectionItem];
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
    
    
    [self.tableView setSectionIndexBackgroundColor:RGBA(255, 255, 255, .2)];
    [self.tableView setSectionIndexColor:STYLE_THEME_COLOR];
}

#pragma mark - interactive ops

- (void)didTapAdd:(id)sender{
    
    DAOpportunityBasicEditor *vc = [DAOpportunityBasicEditor instance];
    
    
//    DACompanyPicker *vc = [DACompanyPicker instance];
    //    [self pushViewController:vc];
    DANavigationController *naviC = [[DANavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:naviC animated:YES completion:^{
        
    }];
}


#pragma mark - components

- (UIBarButtonItem *)addButtonItem{
    if (!_addButtonItem) {
        _addButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconAdd"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapAdd:)];
    }
    return _addButtonItem;
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
    if (section == SectionItem) return 3;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    id value;
//    NSArray *arr = @[@"Medicus",@"OG", @"Become"];
    NSArray *arr = @[@"DemoBGOG.jpg",@"DemoBGMedicus.jpg", @"DemoBGLimv.jpg"];
    value = [arr objectAtIndex:idx];
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DACompanyOpportunitiesViewController *vc = [DACompanyOpportunitiesViewController instance];
    TLOG(@"self.naviC -> %@", self.navigationController);
//    [vc setItem:[DAOpportunityDataset singleton].demoOpportunity];
    [self pushViewController:vc];
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I"];
}

#pragma mark - styles

//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
//    return UIStatusBarAnimationNone;
//}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}


@end
