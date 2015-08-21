//
//  DAOpportunityLoader.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityLoader.h"
#import "GlobalDefine.h"
#import "DAOpportunitiesViewController.h"
#import "DACompaniesViewController.h"
#import "DADefine.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"

@interface DAOpportunityLoader ()

@end

@implementation DAOpportunityLoader

- (instancetype)init{
    self = [super init];
    if (self) {
        [self assembleTabBar];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    DAOpportunitiesViewController *vc = [DAOpportunitiesViewController instance];
//    [self setViewController:vc];
    
    DACompaniesViewController *vc = [DACompaniesViewController instance];
    [self setViewController:vc];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)assembleTabBar{
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY];
    UIImage *img = [[UIImage alloc] init];
    NSInteger tag = DARootTabIdxOpportunity;
//    title = @"";
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img tag:tag];
    [self setTabBarItem:tabBarItem];
}

@end
