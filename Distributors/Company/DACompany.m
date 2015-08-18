//
//  DACompany.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACompany.h"

@implementation DACompany

+ (instancetype)instanceWithName:(NSString *)name{
    DACompany *instance  = [DACompany instance];
    [instance setName:name];
    return instance;
}

- (BOOL)isDummy{
    if (!_name && !_identifier) {
        return YES;
    }
    return NO;
}

@end
