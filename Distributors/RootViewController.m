//
//  DRootViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "RootViewController.h"
#import "DACompanyOpportunitiesViewController.h"

@implementation RootViewController

- (void)popToOpportunityList{
    [self popToRootViewControllerAnimated:NO];
    DACompanyOpportunitiesViewController *vc = [DACompanyOpportunitiesViewController instance];
//    TLOG(@"self.naviC -> %@", self.navigationController);
    //    [vc setItem:[DAOpportunityDataset singleton].demoOpportunity];
    [self pushViewController:vc animated:YES];
}

@end
