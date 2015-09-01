//
//  DAOpportunityTask.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"
#import "DATaskDefine.h"
#import "DADefine.h"

@class DAPeriod;
@interface DATask : AGModel


- (NSString *)textOfType;
- (BOOL)isCompleted;

@property (nonatomic, strong) NSString *identifier;

@property (nonatomic, strong) DAPeriod *period;
@property (nonatomic, assign) DATaskType type;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, assign) NSInteger quanity;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *targetName;
@property (nonatomic, strong) NSString *sentence;



@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, assign) NSInteger timeRequired; //hour
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;



@end
