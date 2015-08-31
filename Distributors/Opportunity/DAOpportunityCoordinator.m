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


@property (nonatomic, strong) NSArray *taskDefineSectionClsNames;
@property (nonatomic, strong) NSArray *taskEditorClsNames;
@property (nonatomic, strong) NSArray *taskIconImages;

@end

@implementation DAOpportunityCoordinator


- (NSString *)textForTaskType:(DAOpportunityTaskType)type{
    @try {
        return [self.taskTexts objectAtIndex:type];
    }@catch (NSException *exception) {}
    
    return [AGTextCoordinator textForKey:KEY_MSG_UNDEFINED];
}

- (Class)taskDefineSectionClsForTaskType:(DAOpportunityTaskType)type{
    NSString *str = [self.taskDefineSectionClsNames objectAtIndex:type];
    return NSClassFromString(str);
}

- (Class)taskEditorClsForTaskType:(DAOpportunityTaskType)type{
    NSString *str = [self.taskEditorClsNames objectAtIndex:type];
    return NSClassFromString(str);
}

- (UIImage *)taskIconImageForTaskType:(DAOpportunityTaskType)type{
    return [self.taskIconImages objectAtIndex:type];
}

#pragma mark - properties

- (NSArray *)taskIconImages{
    if (!_taskIconImages) {
        _taskIconImages = @[
                           [UIImage imageNamed:@"IconTaskTestimonial"],
                           [UIImage imageNamed:@"IconTaskEvents"],
                           [UIImage imageNamed:@"IconTaskProducts"],
                           [UIImage imageNamed:@"IconTaskAutoship"],
                           [UIImage imageNamed:@"IconTaskContacts"],
                           [UIImage imageNamed:@"IconTaskTraining"],
                           [UIImage imageNamed:@"IconTaskOthers"]
                           ];
    }
    return _taskIconImages;
}

- (NSArray *)taskTexts{
    if (!_taskTexts) {
        _taskTexts = @[
                       [AGTextCoordinator textForKey:KEY_LBL_TESTIMONIAL],
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

- (NSArray *)taskDefineSectionClsNames{
    if (!_taskDefineSectionClsNames) {
        _taskDefineSectionClsNames = @[
                                    @"DATestimonialTaskDefineSection",
                                    @"DAEventsTaskDefineSection",
                                    @"DAProductsTaskDefineSection",
                                    @"DAAutoshipTaskDefineSection",
                                    @"DAContactsTaskDefineSection",
                                    @"DATrainingTaskDefineSection",
                                    @"DAOthersTaskDefineSection",
                            
                                    ];
    }
    return _taskDefineSectionClsNames;
}


- (NSArray *)taskEditorClsNames{
    if (!_taskEditorClsNames) {
        _taskEditorClsNames = @[
                                @"DATestimonialTaskEditor",
                                @"DAEventsTaskEditor",
                                @"DAProductsTaskEditor",
                                @"DAAutoshipTaskEditor",
                                @"DAContactsTaskEditor",
                                @"DATrainingTaskEditor",
                                @"DAOthersTaskEditor",
                                ];
    }
    return _taskEditorClsNames;
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
