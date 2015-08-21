//
//  DAOpportunityTemplateCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTemplateCoordinator.h"
#import "DAOpportunityStep.h"
#import "DAOpportunityTask.h"
#import "DAOpportunity.h"
#import "DACompany.h"

@interface DAOpportunityTemplateCoordinator(){
    
}

@property (nonatomic, strong) NSMutableDictionary *data;

@property (nonatomic, strong) DAOpportunity *demoO;


@end

@implementation DAOpportunityTemplateCoordinator

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}




#pragma mark - remote ops

- (void)requestTemplatesByCompany:(DACompany *)company completion:(void (^)(NSArray *))completion{
    if (completion) {
        completion (@[self.demoO]);
    }
}

#pragma mark - utils

- (void)resetTemplateInstance{
    _templateInstance = nil;
}

#pragma mark - properties

- (DAOpportunity *)templateInstance{
    if (!_templateInstance) {
        _templateInstance = [DAOpportunity instance];
    }
    return _templateInstance;
}


- (DAOpportunity *)demoO{
    if (!_demoO) {
        _demoO = [DAOpportunity instance];
        
        [_demoO setName:@"4 Steps to success with OG"];
        
        //step1
        DAOpportunityStep *step1 = [DAOpportunityStep instance];
        [step1 setName:@"Become a Product of the Product"];
        [step1 setTasks:self.demoTasks];
        
        
        DAOpportunityStep *step2 = [DAOpportunityStep instance];
        [step2 setName:@"Build a List of Contacts"];
        [step2 setTasks:self.demoTasks];
        
        DAOpportunityStep *step3 = [DAOpportunityStep instance];
        [step3 setName:@"Book Four Coffee Jazz Mixers"];
        [step3 setTasks:self.demoTasks];
        
        DAOpportunityStep *step4 = [DAOpportunityStep instance];
        [step4 setName:@"Plug into a Proven Success System"];
        [step4 setTasks:self.demoTasks];
        
        [_demoO setSteps:@[step1, step2, step3, step4]];
    }
    return _demoO;
}

- (NSArray *)demoTasks{
    DAOpportunityTask *task1 = [DAOpportunityTask instance];
    [task1 setSentence:@"Submit your testimonial within 48 hours"];
    
    DAOpportunityTask *task2 = [DAOpportunityTask instance];
    [task2 setSentence:@"Set yourself on the proper auto-ship"];
    
    DAOpportunityTask *task3 = [DAOpportunityTask instance];
    [task3 setSentence:@"Purchase 2 boxes of coffee (Black & Latte)"];
    return @[task1, task2, task3];
}


- (NSMutableDictionary *)data{
    if (!_data) {
        _data = [NSMutableDictionary dictionary];
    }
    return _data;
}

@end
