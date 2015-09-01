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
    
    
    DACompanyOpportunitiesViewController *vc;
    
    if ([self.viewControllers.lastObject isKindOfClass:[DACompanyOpportunitiesViewController class]]) {
        vc = self.viewControllers.lastObject;
        [vc setItemCount:10];
        [vc reloadVisibleIndexPaths];
        return;
    }
    
    [self popToRootViewControllerAnimated:NO];
    vc = [DACompanyOpportunitiesViewController instance];
    [vc setItemCount:10];
//    TLOG(@"self.naviC -> %@", self.navigationController);
    //    [vc setItem:[DAOpportunityDataset singleton].demoOpportunity];
    [self pushViewController:vc animated:YES];
}

@end
