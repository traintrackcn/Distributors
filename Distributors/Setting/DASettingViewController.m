//
//  DASettingViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DASettingViewController.h"
#import "DADefine.h"
#import "DATextDefine.h"
#import "DAStyleDefine.h"
#import "DSImage.h"

@interface DASettingViewController ()

@end

@implementation DASettingViewController

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
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_SETTING];
    UIImage *img = [UIImage imageNamed:@"IconSetting"];
    UIImage *imgSolid = [UIImage imageNamed:@"IconSettingSolid"];
    imgSolid = [DSImage image:imgSolid withMaskColor:STYLE_THEME_COLOR];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img selectedImage:imgSolid];
    [self setTabBarItem:tabBarItem];
}

@end
