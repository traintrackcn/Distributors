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
#import "DAChatViewController.h"
#import "DAContactViewController.h"
#import "DASettingViewController.h"
#import "DADiscoverViewController.h"
#import "DAStyleDefine.h"
#import "DSImage.h"

@implementation RootTabController

- (instancetype)init{
    self = [super init];
    if (self) {
//        [self setTitle:@"Hello"];
        [self setViewControllers:@[
                                   [DAChatViewController instance],
                                   [DAContactViewController instance],
                                   [DAOpportunityLoader instance],
                                   [DADiscoverViewController instance],
                                   [DASettingViewController instance]
                                   
                                   ]];
        
        
        UIImage *img = [DSImage rectangleWithSize:CGSizeMake(STYLE_DEVICE_WIDTH, STYLE_TAB_BAR_HEIGHT) fillColor:[UIColor whiteColor]];
        
        [self.tabBar setTintColor:STYLE_THEME_COLOR];
        [self.tabBar setBackgroundImage:img];
        
        [self setSelectedIndex:2];
        
    }
    return self;
}






@end
