//
//  DAOpportunityTask.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATask.h"
#import "NSObject+Singleton.h"

@implementation DATask

- (NSString *)textOfType{
    return [[DATaskDefine singleton] textForTaskType:self.type];
}


#pragma mark - status

- (BOOL)isCompleted{
    if (self.progress == 1.0) {
        return YES;
    }
    return NO;
}

@end
