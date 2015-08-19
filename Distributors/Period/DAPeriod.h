//
//  DAPeriod.h
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"

@interface DAPeriod : AGModel

+ (instancetype)instanceWithName:(NSString *)name;

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;

@end
