//
//  DAOpportunityTemplatePicker.h
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGViewController.h"

@class DACompany;
@class DAOpportunity;
@interface DAOpportunityTemplatePicker : AGViewController

@property (nonatomic, weak) DACompany *company;
@property (nonatomic, strong) DAOpportunity *template;

@end
