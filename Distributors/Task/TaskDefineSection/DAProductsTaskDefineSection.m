//
//  DADefineProductsTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAProductsTaskDefineSection.h"

@implementation DAProductsTaskDefineSection

- (id)valueAtIndex:(NSInteger)index{
    id value = [super valueAtIndex:index];
    
    if (index == SectionCellName) {
        value = @"Buy/sell products";
    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return 2;
}


@end
