//
//  DAOpportunityCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityCoordinator.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "DAOpportunity.h"
//#import "DAStep.h"
#import "DATask.h"



@interface DAOpportunityCoordinator(){
    
}




@end

@implementation DAOpportunityCoordinator




#pragma mark - utils

- (void)resetOpportunityInstance{
    _opportunityInstance = nil;
}

//- (void)resetStepInstance{
//    _stepInstance = nil;
//}

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

//- (DAStep *)stepInstance{
//    if (!_stepInstance) {
//        _stepInstance = [DAStep instance];
//    }
//    return _stepInstance;
//}

- (DATask *)taskInstance{
    if (!_taskInstance) {
        _taskInstance = [DATask instance];
    }
    return _taskInstance;
}


@end
