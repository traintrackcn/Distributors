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

@interface DADiscoverViewController ()

@end

@implementation DADiscoverViewController


- (instancetype)init{
    self = [super init];
    if (self) {
        [self assembleTabBar];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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

@end
