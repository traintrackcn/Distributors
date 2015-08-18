//
//  DACurrency.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"

@interface DACurrency : AGModel

+ (instancetype)instanceWithSymbol:(NSString *)symbol code:(NSString *)code;

@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *code;

@end
