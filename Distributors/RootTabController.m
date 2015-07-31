//
//  RootTabController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "RootTabController.h"
#import "DAOpportunitiesViewController.h"
#import "DARecentChatsViewController.h"

@implementation RootTabController

- (instancetype)init{
    self = [super init];
    if (self) {
//        [self setTitle:@"Hello"];
        [self setViewControllers:@[
                                   [DAOpportunitiesViewController instance],
                                   [DARecentChatsViewController instance]
                                   ]];
        
    }
    return self;
}





@end
