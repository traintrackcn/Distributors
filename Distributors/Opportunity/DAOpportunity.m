//
//  DAOpportunity.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunity.h"
#import "DAEarningPotentialDataset.h"
#import "NSObject+Singleton.h"
#import "DACompany.h"
#import "DAOpportunityDataset.h"

@implementation DAOpportunity

- (DAEarningPotential *)earningPotential{
    if (_earningPotential) return _earningPotential;
    return [DAEarningPotentialDataset singleton].defaultItem;
}


#pragma mark - properties

- (DACompany *)company{
    if (!_company) {
        _company = [DACompany instance];
    }
    return _company;
}


- (NSArray *)tasksOngoing{
    return [DAOpportunityDataset singleton].demoTasksOngoing;
}

- (NSArray *)tasksCompleted{
    return [DAOpportunityDataset singleton].demoTasksCompleted;
}

@end
