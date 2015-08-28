//
//  DAContactsViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAContactViewController.h"
#import "DATextDefine.h"
#import "DADefine.h"
#import "DAStyleDefine.h"
#import "DSImage.h"

@interface DAContactViewController ()

@end

@implementation DAContactViewController

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
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, STYLE_DEVICE_HEIGHT)];
    [imgV setImage:[UIImage imageNamed:@"DemoContact"]];
    [imgV setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:imgV];
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
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_CONTACT];
    UIImage *img = [UIImage imageNamed:@"IconContact"];
    UIImage *imgSolid = [UIImage imageNamed:@"IconContactSolid"];
    imgSolid = [DSImage image:imgSolid withMaskColor:STYLE_THEME_COLOR];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img selectedImage:imgSolid];
    [self setTabBarItem:tabBarItem];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
