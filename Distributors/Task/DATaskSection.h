//
//  DAOpportunityTaskSection.h
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGSectionUnit.h"

@class DAStep;
@interface DATaskSection : AGSectionUnit


- (NSInteger)lastIndex;

@property (nonatomic, assign) BOOL editMode;

@property (nonatomic, weak) DAStep *item;

@end
