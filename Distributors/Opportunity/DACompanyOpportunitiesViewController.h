//
//  DAOpportunitiesViewController.h
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGViewController.h"

@class DACompany;

@interface DACompanyOpportunitiesViewController : AGViewController

@property (nonatomic, strong) DACompany *item;
@property (nonatomic, assign) NSInteger itemCount;

@end
