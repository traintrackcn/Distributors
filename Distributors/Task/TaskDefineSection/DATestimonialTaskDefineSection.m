//
//  DADefineTestimonialTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATestimonialTaskDefineSection.h"

@implementation DATestimonialTaskDefineSection


- (id)valueAtIndex:(NSInteger)index{
    id value = [super valueAtIndex:index];
    
    if (index == SectionCellName) {
        value = @"Submit testmonial";
    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return 2;
}


@end
