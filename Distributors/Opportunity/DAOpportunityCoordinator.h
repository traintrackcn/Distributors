//
//  DAOpportunityCoordinator.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Singleton.h"
#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, DAOpportunityTaskType) {
//    DAOpportunityTaskTypeTestimonial,
//    DAOpportunityTaskTypeEvents,
//    DAOpportunityTaskTypeProducts,
//    DAOpportunityTaskTypeAutoship,
//    DAOpportunityTaskTypeContacts,
//    DAOpportunityTaskTypeTraining,
//    DAOpportunityTaskTypeOthers,
//    DAOpportunityTaskTypeCount
//};

@class DAOpportunity;
//@class DAStep;
@class DATask;

@interface DAOpportunityCoordinator : NSObject



//- (NSString *)textForTaskType:(DAOpportunityTaskType)type;
//- (Class)taskDefineSectionClsForTaskType:(DAOpportunityTaskType)type;
//- (Class)taskEditorClsForTaskType:(DAOpportunityTaskType)type;
//- (UIImage *)taskIconImageForTaskType:(DAOpportunityTaskType)type;

- (void)resetOpportunityInstance;
//- (void)resetStepInstance;
- (void)resetTaskInstance;


@property (nonatomic, strong) DAOpportunity *opportunityInstance;
//@property (nonatomic, strong) DAStep *stepInstance;
@property (nonatomic, strong) DATask *taskInstance;

@end
