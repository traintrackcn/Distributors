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
//    DATask *task1 = [DATask instance];
//    [task1 setSentence:@"Submit your testimonial within 48 hours"];
//    [task1 setType:DAOpportunityTaskTypeTestimonial];
    
//    TLOG(@"after task1");
    
    DATask *task2 = [DATask instance];
    [task2 setSentence:@"Build a List of Contacts of 50 Coffee Drinkers"];
    [task2 setType:DATaskTypeContacts];
    
    DATask *task3 = [DATask instance];
    [task3 setSentence:@"Build a List of Contacts of 50 Opportunity Seekers"];
    [task3 setType:DATaskTypeContacts];
    
    DATask *task4 = [DATask instance];
    [task4 setSentence:@"Learn and use the 4 Questions"];
    [task4 setType:DATaskTypeOthers];
    
    DATask *task5 = [DATask instance];
    [task5 setSentence:@"Get Customers now with the Script "];
    [task5 setType:DATaskTypeOthers];
    
    DATask *task6 = [DATask instance];
    [task6 setSentence:@"Book Four Coffee Jazz Mixers"];
    [task6 setType:DATaskTypeEvents];
    
    DATask *task7 = [DATask instance];
    [task7 setSentence:@"18 Month commitment to a proven system"];
    [task7 setType:DATaskTypeTestimonial];
    
    DATask *task8 = [DATask instance];
    [task8 setSentence:@"Register for FREE at www.OGUniversity.com"];
    [task8 setType:DATaskTypeOthers];
    
    DATask *task9 = [DATask instance];
    [task9 setSentence:@"Attend 3 weekly CJM's"];
    [task9 setType:DATaskTypeEvents];
    
    DATask *task10 = [DATask instance];
    [task10 setSentence:@"Attend 2 Business and leadership events"];
    [task10 setType:DATaskTypeEvents];
    
    DATask *task11 = [DATask instance];
    [task11 setSentence:@"Join 5 Opportunity and training calls"];
    [task11 setType:DATaskTypeTraining];
    
    return @[task2, task3, task4, task5, task6,task7, task8, task9, task10, task11];
}

@end
