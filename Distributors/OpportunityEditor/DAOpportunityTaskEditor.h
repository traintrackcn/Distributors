//
//  DAOpportunityTaskEditor.h
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGViewController.h"

@class DAOpportunityStep;
@class DAOpportunityTask;
@interface DAOpportunityTaskEditor : AGViewController

@property (nonatomic, weak) DAOpportunityStep *step;
@property (nonatomic, weak) DAOpportunityTask *task;

@end
