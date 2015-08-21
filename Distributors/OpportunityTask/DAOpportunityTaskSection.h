//
//  DAOpportunityTaskSection.h
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGSectionUnit.h"

@class DAOpportunityStep;
@interface DAOpportunityTaskSection : AGSectionUnit

@property (nonatomic, weak) DAOpportunityStep *item;

@end
