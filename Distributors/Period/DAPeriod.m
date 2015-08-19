//
//  DAPeriod.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAPeriod.h"

@implementation DAPeriod

+ (instancetype)instanceWithName:(NSString *)name{
    DAPeriod *instance = [DAPeriod instance];
    [instance setName:name];
    return instance;
}

@end
