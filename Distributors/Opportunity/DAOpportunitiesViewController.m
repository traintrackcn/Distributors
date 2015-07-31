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
//#import <UIKit/UIKit.h>

@interface DAOpportunitiesViewController(){
    
}


@end

@implementation DAOpportunitiesViewController

- (instancetype)init{
    self = [super init];
    if (self) {
//        [self setTitle:@""];
        [self.config setCellCls:[AGTextCell class] inSection:0];
        [self assembleTabBar];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)assembleTabBar{
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY];
    UIImage *img = [[UIImage alloc] init];
    NSInteger tag = TAB_IDX_OPPORTUNITY;
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img tag:tag];
    [self setTabBarItem:tabBarItem];
}


#pragma mark - table view data

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    id value = [NSString stringWithFormat:@"Opportunity-%d", idx];
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DAOpportunityViewController *vc = [DAOpportunityViewController instance];
    TLOG(@"self.naviC -> %@", self.navigationController);
    [self.navigationController pushViewController:vc animated:YES];
}



@end
