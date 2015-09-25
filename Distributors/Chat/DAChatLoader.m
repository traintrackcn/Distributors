//
//  DAChatLoader.m
//  Distributors
//
//  Created by Tao Yunfei on 9/10/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAChatLoader.h"
#import "DATextDefine.h"
#import "DAConversationsViewController.h"
#import "DSImage.h"
#import "DAStyleDefine.h"
#import "DAChatCoordinator.h"

@implementation DAChatLoader

- (instancetype)init{
    self = [super init];
    if (self) {
        [self assembleTabBar];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    DAConversationsViewController *vc = [DAConversationsViewController instance];
    [self setViewController:vc];
    
    [DAChatCoordinator singleton];
}


- (void)assembleTabBar{
    NSString *title = [AGTextCoordinator textForKey:KEY_LBL_CHAT];
    UIImage *img = [UIImage imageNamed:@"IconChat"];
    UIImage *imgSolid = [UIImage imageNamed:@"IconChatSolid"];
    imgSolid = [DSImage image:imgSolid withMaskColor:STYLE_THEME_COLOR];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img selectedImage:imgSolid];
    [self setTabBarItem:tabBarItem];
}


@end
