//
//  RootTabController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "RootTabController.h"
//#import "DAOpportunitiesViewController.h"
#import "DAOpportunityLoader.h"
#import "DAChatLoader.h"
#import "DAContactViewController.h"
#import "DASettingViewController.h"
#import "DADiscoverViewController.h"
#import "DAStyleDefine.h"
#import "DSImage.h"
#import "DATabBarCenterButton.h"

@interface RootTabController(){
    
}



@end

@implementation RootTabController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setViewControllers:@[
                                   [DAChatLoader instance],
                                   [DAContactViewController instance],
                                   [DAOpportunityLoader instance],
                                   [DADiscoverViewController instance],
                                   [DASettingViewController instance]
                                   
                                   ]];
        
        
        UIImage *img = [DSImage rectangleWithSize:CGSizeMake(STYLE_DEVICE_WIDTH, STYLE_TAB_BAR_HEIGHT) fillColor:[UIColor whiteColor]];
        
        [self.tabBar setTintColor:STYLE_THEME_COLOR];
        [self.tabBar setBackgroundImage:img];
        [self.view addSubview:self.centerButton];
        
        
        
        [self setSelectedIndex:self.centerButton.index];
        [self.centerButton setSelected:YES];
        
    }
    return self;
}


- (DATabBarCenterButton *)centerButton{
    if (!_centerButton) {
        UIImage *img = [UIImage imageNamed:@"IconOpportunity"];
        UIImage *imgSolid = [UIImage imageNamed:@"IconOpportunitySolid"];
        
        img = [DSImage image:img withMaskColor:STYLE_ICON_COLOR_UNSELECTED];
        imgSolid = [DSImage image:imgSolid withMaskColor:STYLE_THEME_COLOR];
//        UIImage *normalImage = [UIImage imageNamed:@"hood.png"];
//        UIImage *highlightImage = [UIImage imageNamed:@"hood-selected.png"];
        _centerButton = [[DATabBarCenterButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 60, 60) tabBarController:self];
//        _centerButton.layer.borderWidth = 1;
        [_centerButton setNormalImage:img highlightImage:imgSolid];
    }
    return _centerButton;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if(self.tabBarController.selectedIndex != self.centerButton.index){
        //        [self performSelector:@selector(doNotHighlight:) withObject:self.centerButton afterDelay:0];
        [self.centerButton setSelected:NO];
    }
}

@end
