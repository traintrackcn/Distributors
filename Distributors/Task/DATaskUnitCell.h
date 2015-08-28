//
//  DATaskUnitCell.h
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGCell.h"

@interface DATaskUnitCell : AGCell

- (CGFloat)titleH;
- (NSString *)iconName;
- (UIColor *)iconColor;
- (void)layoutTitleLabel;
- (void)layoutIconView;


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end
