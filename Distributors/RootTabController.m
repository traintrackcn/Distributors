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
#import "DAContactsViewController.h"
#import "DASettingViewController.h"
#import "DADiscoverViewController.h"

@implementation RootTabController

- (instancetype)init{
    self = [super init];
    if (self) {
//        [self setTitle:@"Hello"];
        [self setViewControllers:@[
                                   [DAChatViewController instance],
                                   [DAContactsViewController instance],
                                   [DADiscoverViewController instance],
                                   [DAOpportunityLoader instance],
                                   [DASettingViewController instance]
                                   
                                   ]];
        
    }
    return self;
}





@end
