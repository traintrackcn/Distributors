//
//  DARecentChatsViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAChatViewController.h"
#import "DADefine.h"
#import "DATextDefine.h"
#import "DAStyleDefine.h"
#import "DSImage.h"

@implementation DAChatViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        //        [self setTitle:@""];
//        [self.config setCellCls:[AGTextCell class] inSection:0];
        [self assembleTabBar];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, STYLE_DEVICE_HEIGHT)];
    [imgV setImage:[UIImage imageNamed:@"DemoChat"]];
    [imgV setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:imgV];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


- (void)assembleTabBar{
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_CHAT];
    UIImage *img = [UIImage imageNamed:@"IconChat"];
    UIImage *imgSolid = [UIImage imageNamed:@"IconChatSolid"];
    imgSolid = [DSImage image:imgSolid withMaskColor:STYLE_THEME_COLOR];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img selectedImage:imgSolid];
    [self setTabBarItem:tabBarItem];
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
