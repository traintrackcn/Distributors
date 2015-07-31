//
//  DARecentChatsViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DARecentChatsViewController.h"
#import "DADefine.h"
#import "DATextKeyDefine.h"
#import "AGTextCoordinator.h"

@implementation DARecentChatsViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        //        [self setTitle:@""];
//        [self.config setCellCls:[AGTextCell class] inSection:0];
        [self assembleTabBar];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


- (void)assembleTabBar{
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_CHAT];
    UIImage *img = [[UIImage alloc] init];
    NSInteger tag = TAB_IDX_CHAT;
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img tag:tag];
    [self setTabBarItem:tabBarItem];
}


@end
