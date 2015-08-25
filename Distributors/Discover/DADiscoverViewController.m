//
//  DADiscoverViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADiscoverViewController.h"
#import "AGTextCoordinator.h"
#import "DADefine.h"
#import "DATextKeyDefine.h"
#import "AGViewController+Datasource.h"
#import "AGVCConfiguration.h"
#import "DAMapCell.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"
#import "GlobalDefine.h"

@interface DADiscoverViewController (){
    
}

@property (nonatomic, strong) UITextField *searchField;

@end

@implementation DADiscoverViewController


- (instancetype)init{
    self = [super init];
    if (self) {
        [self assembleTabBar];
        
        [self.config setCellCls:[DAMapCell class] inSection:0];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)layoutViews{
    [super layoutViews];
//    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    TLOG(@"self.view -> %@ children -> %@", self.view, self.view.subviews);
    
//    if (![self.view.subviews containsObject:self.searchField]) {
        [self.view addSubview:self.searchField];
        [self.view bringSubviewToFront:self.searchField];
//    }
    
}

- (void)willReloadVisibleIndexPaths{
    [super willReloadVisibleIndexPaths];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)assembleTabBar{
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_DISCOVER];
    UIImage *img = [[UIImage alloc] init];
    NSInteger tag = DARootTabIdxDiscover;
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img tag:tag];
    [self setTabBarItem:tabBarItem];
}

#pragma mark - 

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - components

- (UITextField *)searchField{
    if (!_searchField) {
        CGFloat x = 15.0;
        CGFloat y = 15;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        CGFloat h = 44.0;
        _searchField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_searchField.layer setCornerRadius:8.0];
        [_searchField.layer setBorderWidth:.5f];
        [_searchField setAlpha:.5];
        [_searchField setFont:[AGStyleCoordinator fontWithSize:18]];
        [_searchField setBackgroundColor:[UIColor whiteColor]];
    }
    return _searchField;
}

@end
