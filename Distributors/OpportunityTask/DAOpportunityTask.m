//
//  DAOpportunityTask.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTask.h"
#import "NSObject+Singleton.h"

@implementation DAOpportunityTask

- (NSString *)textOfType{
    return [[DAOpportunityCoordinator singleton] textForTaskType:self.type];
}

@end
