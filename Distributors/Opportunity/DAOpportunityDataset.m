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
        [_demoOpportunity setTasks:self.demoTasksOngoing];
    }
    return _demoOpportunity;
}

- (NSArray *)demoTasksOngoing{
//    return @[];
    if (!_demoTasksOngoing){
    
    DATask *task1 = [DATask instance];
    [task1 setSentence:@"Submit your testimonial within 48 hours"];
    [task1 setType:DATaskTypeTestimonial];
    
    DATask *task1_1 = [DATask instance];
    [task1_1 setSentence:@"Set yourself up on the proper Autoship"];
    [task1_1 setType:DATaskTypeAutoship];
//    [task1_1 setProgress:.3];
    
    DATask *task1_2 = [DATask instance];
    [task1_2 setSentence:@"Purchase 2 Boxes of Coffee"];
    [task1_2 setType:DATaskTypeProducts];
    [task1_2 setProgress:.3];
    
    DATask *task2 = [DATask instance];
    [task2 setSentence:@"Build a List of Contacts of 50 Coffee Drinkers"];
    [task2 setType:DATaskTypeContacts];
    [task2 setProgress:.3];
    
    DATask *task3 = [DATask instance];
    [task3 setSentence:@"Build a List of Contacts of 50 Opportunity Seekers"];
    [task3 setType:DATaskTypeContacts];
    [task3 setProgress:.3];
    
    DATask *task4 = [DATask instance];
    [task4 setSentence:@"Learn and use the 4 Questions"];
    [task4 setType:DATaskTypeOthers];
//    [task4 setProgress:.3];
    
    DATask *task5 = [DATask instance];
    [task5 setSentence:@"Get Customers now with the Script "];
    [task5 setType:DATaskTypeOthers];
//    [task5 setProgress:.3];
    
    DATask *task6 = [DATask instance];
    [task6 setSentence:@"Book Four Coffee Jazz Mixers"];
    [task6 setType:DATaskTypeEvents];
    [task6 setProgress:.3];
    
    DATask *task7 = [DATask instance];
    [task7 setSentence:@"18 Month commitment to a proven system"];
    [task7 setType:DATaskTypeTestimonial];
//    [task7 setProgress:.3];
    
    DATask *task8 = [DATask instance];
    [task8 setSentence:@"Register for FREE at www.OGUniversity.com"];
    [task8 setType:DATaskTypeOthers];
    [task8 setProgress:.3];
    
    DATask *task9 = [DATask instance];
    [task9 setSentence:@"Attend 3 weekly CJM's"];
    [task9 setType:DATaskTypeEvents];
    [task9 setProgress:.3];
    
    DATask *task10 = [DATask instance];
    [task10 setSentence:@"Attend 2 Business and leadership events"];
    [task10 setType:DATaskTypeEvents];
    [task10 setProgress:.3];
    
    DATask *task11 = [DATask instance];
    [task11 setSentence:@"Join 5 Opportunity and training calls"];
    [task11 setType:DATaskTypeTraining];
    [task11 setProgress:.3];
    
    _demoTasksOngoing = @[task1, task1_1, task1_2, task2, task3, task4, task5, task6,task7, task8, task9, task10, task11];
    }
    return _demoTasksOngoing;
}


- (NSArray *)demoTasksCompleted{
    //    return @[];
    if (!_demoTasksCompleted) {
        DATask *task1 = [DATask instance];
        [task1 setSentence:@"Submit your testimonial within 48 hours"];
        [task1 setType:DATaskTypeTestimonial];
        [task1 setProgress:1];
        
        DATask *task1_1 = [DATask instance];
        [task1_1 setSentence:@"Set yourself up on the proper Autoship"];
        [task1_1 setType:DATaskTypeAutoship];
        [task1_1 setProgress:1];
        
        DATask *task1_2 = [DATask instance];
        [task1_2 setSentence:@"Purchase 2 Boxes of Coffee"];
        [task1_2 setType:DATaskTypeProducts];
        [task1_2 setProgress:1];
        _demoTasksCompleted = @[task1, task1_1, task1_2];
    }
    
    return _demoTasksCompleted;
    
}

@end
