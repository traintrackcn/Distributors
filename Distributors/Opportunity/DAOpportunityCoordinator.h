//
//  DAOpportunityCoordinator.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Singleton.h"

typedef NS_ENUM(NSInteger, DAOpportunityTaskType) {
    DAOpportunityTaskTypeEvents,
    DAOpportunityTaskTypeProducts,
    DAOpportunityTaskTypeAutoship,
    DAOpportunityTaskTypeContacts,
    DAOpportunityTaskTypeTraining,
    DAOpportunityTaskTypeOthers,
    DAOpportunityTaskTypeCount
};

@class DAOpportunity;
@class DAOpportunityStep;
@class DAOpportunityTask;

@interface DAOpportunityCoordinator : NSObject

@property (nonatomic, strong) NSArray *taskTexts;

- (NSString *)textForTaskType:(DAOpportunityTaskType)type;

- (void)resetOpportunityInstance;
- (void)resetStepInstance;
- (void)resetTaskInstance;


@property (nonatomic, strong) DAOpportunity *opportunityInstance;
@property (nonatomic, strong) DAOpportunityStep *stepInstance;
@property (nonatomic, strong) DAOpportunityTask *taskInstance;

@end
