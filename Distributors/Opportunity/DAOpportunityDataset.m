//
//  DAOpportunityTemplateCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityDataset.h"
#import "DATask.h"
#import "DAOpportunity.h"
#import "DACompany.h"
#import "GlobalDefine.h"

@interface DAOpportunityDataset(){
    
}




@end

@implementation DAOpportunityDataset

- (instancetype)init{
    self = [super init];
    if (self) {
        [self declareDatasetIsDictionary];
    }
    return self;
}




#pragma mark - remote ops

- (void)requestTemplatesByCompany:(DACompany *)company completion:(void (^)(NSArray *))completion{
//    TLOG(@"demoOpportunity -> %@", self.demoOpportunity);
    if (completion) {
        completion (@[self.demoOpportunity]);
    }
}



- (DAOpportunity *)demoOpportunity{
    if (!_demoOpportunity) {
        _demoOpportunity = [DAOpportunity instance];
        
        [_demoOpportunity setName:@"4 Steps to success with OG"];
        
//        TLOG(@"before step1");
        
        //step1
//        DAStep *step1 = [DAStep instance];
//        [step1 setName:@"Become a Product of the Product"];
//        [step1 setTasks:self.demoTasks];
//        
////        TLOG(@"after step1");
//        
//        DAStep *step2 = [DAStep instance];
//        [step2 setName:@"Build a List of Contacts"];
//        [step2 setTasks:self.demoTasks];
//        
//        DAStep *step3 = [DAStep instance];
//        [step3 setName:@"Book Four Coffee Jazz Mixers"];
//        [step3 setTasks:self.demoTasks];
//        
//        DAStep *step4 = [DAStep instance];
//        [step4 setName:@"Plug into a Proven Success System"];
//        [step4 setTasks:self.demoTasks];
        
        [_demoOpportunity setTasks:self.demoTasks];
    }
    return _demoOpportunity;
}

- (NSArray *)demoTasks{
//    return @[];
    DATask *task1 = [DATask instance];
    [task1 setSentence:@"Submit your testimonial within 48 hours"];
    [task1 setType:DAOpportunityTaskTypeTestimonial];
    
//    TLOG(@"after task1");
    
    DATask *task2 = [DATask instance];
    [task2 setSentence:@"Set yourself on the proper auto-ship"];
    [task2 setType:DAOpportunityTaskTypeAutoship];
    
    DATask *task3 = [DATask instance];
    [task3 setSentence:@"Purchase 2 boxes of coffee (Black & Latte)"];
    [task3 setType:DAOpportunityTaskTypeProducts];
    
    DATask *task4 = [DATask instance];
    [task4 setSentence:@"Attend 3 events"];
    [task4 setType:DAOpportunityTaskTypeEvents];
    
    DATask *task5 = [DATask instance];
    [task5 setSentence:@"Read documents and make 10 calls"];
    [task5 setType:DAOpportunityTaskTypeTraining];
    
    DATask *task6 = [DATask instance];
    [task6 setSentence:@"Contact 20 persons"];
    [task6 setType:DAOpportunityTaskTypeContacts];
    
    return @[task1, task2, task3, task4, task5, task6];
}

@end
