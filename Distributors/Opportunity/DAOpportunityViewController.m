//
//  DAOpportunityViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityViewController.h"
#import "RootViewController.h"
#import "NSObject+Singleton.h"
#import "AGTextCell.h"
#import "GlobalDefine.h"

@implementation DAOpportunityViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        //        [self setTitle:@""];
        [self.config setCellCls:[AGTextCell class] inSection:0];
//        [self assembleTabBar];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}




#pragma mark - table view data

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    id value = [NSString stringWithFormat:@"Opportunity-%ld", (long)idx];
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DAOpportunityViewController *vc = [DAOpportunityViewController instance];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
