//
//  DAOpportunityCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityCoordinator.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "DAOpportunity.h"
#import "DAOpportunityStep.h"
#import "DAOpportunityTask.h"

@interface DAOpportunityCoordinator(){
    
}



@end

@implementation DAOpportunityCoordinator


- (NSString *)textForTaskType:(DAOpportunityTaskType)type{
    @try {
        return [self.taskTexts objectAtIndex:type];
    }@catch (NSException *exception) {}
    
    return [AGTextCoordinator textForKey:KEY_MSG_UNDEFINED];
}

#pragma mark - properties

- (NSArray *)taskTexts{
    if (!_taskTexts) {
        _taskTexts = @[
                       [AGTextCoordinator textForKey:KEY_LBL_EVENTS],
                       [AGTextCoordinator textForKey:KEY_LBL_PRODUCTS],
                       [AGTextCoordinator textForKey:KEY_LBL_AUTOSHIP],
                       [AGTextCoordinator textForKey:KEY_LBL_CONTACTS],
                       [AGTextCoordinator textForKey:KEY_LBL_TRAINING],
                       [AGTextCoordinator textForKey:KEY_LBL_OTHERS],
                       ];
    }
    return _taskTexts;
}


#pragma mark - utils

- (void)resetOpportunityInstance{
    _opportunityInstance = nil;
}

- (void)resetStepInstance{
    _stepInstance = nil;
}

- (void)resetTaskInstance{
    _taskInstance = nil;
}

#pragma mark - properties

- (DAOpportunity *)opportunityInstance{
    if (!_opportunityInstance) {
        _opportunityInstance = [DAOpportunity instance];
    }
    return _opportunityInstance;
}

- (DAOpportunityStep *)stepInstance{
    if (!_stepInstance) {
        _stepInstance = [DAOpportunityStep instance];
    }
    return _stepInstance;
}

- (DAOpportunityTask *)taskInstance{
    if (!_taskInstance) {
        _taskInstance = [DAOpportunityTask instance];
    }
    return _taskInstance;
}


@end
