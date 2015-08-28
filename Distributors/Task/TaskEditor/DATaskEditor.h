//
//  DAOpportunityTaskEditor.h
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskViewController.h"

@class DAStep;
@class DATask;
@interface DATaskEditor : DATaskViewController

@property (nonatomic, weak) DAStep *step;
//@property (nonatomic, weak) DATask *task;

@end
