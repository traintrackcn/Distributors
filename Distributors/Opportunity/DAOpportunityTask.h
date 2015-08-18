//
//  DAOpportunityTask.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"
#import "DAOpportunityDefine.h"

@interface DAOpportunityTask : AGModel

@property (nonatomic, strong) NSString *identifier;

@property (nonatomic, assign) OpportunityTaskPeriod period;
@property (nonatomic, assign) OpportunityTaskType type;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, assign) NSInteger quanity;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *targetName;



@end
