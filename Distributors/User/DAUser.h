//
//  DAUser.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"

@interface DAUser : AGModel

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *loginID;
@property (nonatomic, strong) NSString *loginPWD;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageUrl;

@end
