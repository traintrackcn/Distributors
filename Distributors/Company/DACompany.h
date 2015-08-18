//
//  DACompany.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"

@interface DACompany : AGModel

+ (instancetype)instanceWithName:(NSString *)name;

- (BOOL)isDummy;

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;


@end
