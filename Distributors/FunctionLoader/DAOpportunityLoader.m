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
#import "DACompanyPicker.h"
#import "DADefine.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "DAOwnedOpportunityViewController.h"
#import "AGStyleCoordinator.h"
#import "DAOpportunityDataset.h"

@interface DAOpportunityLoader (){

}

@property (nonatomic, strong) UIBarButtonItem *progressBtnItem;
//@property (nonatomic, strong) UIBarButtonItem *closeBtnItem;

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
    
    DAOpportunitiesViewController *vc = [DAOpportunitiesViewController instance];
    [self setViewController:vc];
    
//    DACompaniesViewController *vc = [DACompaniesViewController instance];
//    [self setViewController:vc];
    [vc.navigationItem setLeftBarButtonItem:self.progressBtnItem];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - interactive ops

- (void)didTapProgress:(id)sender{
    DAOwnedOpportunityViewController *vc = [DAOwnedOpportunityViewController instance];
    UINavigationController *naviC = [[UINavigationController alloc] initWithRootViewController:vc];
    [vc setItem:[DAOpportunityDataset singleton].demoOpportunity];
    [self.navigationController presentViewController:naviC animated:YES completion:nil];
    
    
}



#pragma mark - components

- (void)assembleTabBar{
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY];
    UIImage *img = [[UIImage alloc] init];
    NSInteger tag = DARootTabIdxOpportunity;
//    title = @"";
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img tag:tag];
    [self setTabBarItem:tabBarItem];
}



- (UIBarButtonItem *)progressBtnItem{
    if (!_progressBtnItem) {
        UIImage *img = [UIImage imageNamed:@"nopic_mini.jpg"];
        UIImageView *v = [[UIImageView alloc] initWithImage:img];
        UITapGestureRecognizer *gc = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapProgress:)];
        
        [AGStyleCoordinator decorateCircleMaskForView:v radius:20];
        
        [v setFrame:CGRectMake(0, 0, 40, 40)];
        [v setUserInteractionEnabled:YES];
        [v addGestureRecognizer:gc];
        [v setContentMode:UIViewContentModeScaleAspectFit];
        
//        _progressBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"Progress" style:UIBarButtonItemStylePlain target:self action:@selector(didTapProgress:)];
        _progressBtnItem = [[UIBarButtonItem alloc] initWithCustomView:v];
    }
    return _progressBtnItem;
}



@end
