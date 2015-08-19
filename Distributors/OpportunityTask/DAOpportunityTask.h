//
//  DAOpportunityTask.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"
#import "DAOpportunityDefine.h"
#import "DADefine.h"

@class DAPeriod;
@interface DAOpportunityTask : AGModel

@property (nonatomic, strong) NSString *identifier;

@property (nonatomic, strong) DAPeriod *period;
@property (nonatomic, assign) DAOpportunityTaskType type;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, assign) NSInteger quanity;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *targetName;
@property (nonatomic, strong) NSString *sentence;

@property (nonatomic, assign) NSInteger hours;



@end
