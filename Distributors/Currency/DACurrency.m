//
//  DACurrency.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACurrency.h"

@implementation DACurrency

+ (instancetype)instanceWithSymbol:(NSString *)symbol code:(NSString *)code{
    DACurrency *instance = [DACurrency instance];
    [instance setSymbol:symbol];
    [instance setCode:code];
    return instance;
}

@end
