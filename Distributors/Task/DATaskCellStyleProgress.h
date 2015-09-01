//
//  DAOpportunityTaskProgressCell.h
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGCell.h"

@class AGLineProgressView;

@interface DATaskCellStyleProgress : AGCell

@property (nonatomic, strong) AGLineProgressView *progressView;

@property (nonatomic, strong) UIView *moreStatusContainer;

@property (nonatomic, strong) UILabel *titleView;

@end
