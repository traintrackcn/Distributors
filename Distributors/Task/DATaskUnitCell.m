//
//  DATaskUnitCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskUnitCell.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"
#import "GlobalDefine.h"
#import "UILabel+AGUtil.h"
#import "DSImage.h"

@interface DATaskUnitCell(){
    
}

@end

@implementation DATaskUnitCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subtitleLabel];
        [self.contentView addSubview:self.iconView];
    }
    return self;
}

- (void)setValue:(id)value{
    [super setValue:value];
    [self.titleLabel setText:[NSString stringWithFormat:@"%@",value]];
    [self layoutTitleLabel];
    [self layoutIconView];
}

#pragma mark - layout

- (void)layoutTitleLabel{
    CGFloat w = self.titleW;
    CGFloat h = self.titleH;
    [self.titleLabel resizeWithMaxSize:CGSizeMake(w, h)];
}

- (void)layoutIconView{
    CGFloat y = (self.paddingTB*2+self.titleLabel.frame.size.height - self.iconView.frame.size.height)/2.0;
    CGRect frame = self.iconView.frame;
    frame.origin = CGPointMake(frame.origin.x, y);
    [self.iconView setFrame:frame];
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR*4;
        CGFloat y = self.paddingTB;
        
        _titleLabel = [[UILabel alloc] init];
        
        [_titleLabel setFrame:CGRectMake(x, y, self.titleW, self.titleH)];
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:16]];
        [_titleLabel setNumberOfLines:3];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
//        _titleLabel.layer.borderWidth = 1;
    }
    return _titleLabel;
}

- (UIImageView *)iconView{
    if (!_iconView) {
        CGFloat x = self.paddingLR;
        CGFloat w = self.iconW;
        CGFloat h = w;
        CGFloat y = (self.paddingTB*2+self.titleH - h)/2.0;
//        y = 10;
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _iconView.layer.borderWidth = 1;
        [_iconView setContentMode:UIViewContentModeScaleAspectFill];
        
        if (self.iconName) {
            UIImage *img = [UIImage imageNamed:self.iconName];
            img = [DSImage image:img withMaskColor:self.iconColor];
            [_iconView setImage:img];
        }
    }
    return _iconView;
}

- (UILabel *)subtitleLabel{
    if (!_subtitleLabel) {
        CGFloat x = self.titleLabel.frame.origin.x;
        CGFloat y = self.paddingTB + self.titleH + self.vSpace;
        CGFloat w = self.titleW;
        CGFloat h = self.height - self.paddingTB*2 - self.titleH - self.vSpace;
        
        _subtitleLabel = [[UILabel alloc] init];
        [_subtitleLabel setFrame:CGRectMake(x, y, w, h)];
        [_subtitleLabel setFont:[AGStyleCoordinator fontWithSize:12]];
//        _subtitleLabel.layer.borderWidth = 1;
        [_subtitleLabel setText:@"subtitle"];
        [_subtitleLabel setTextColor:RGBA(177, 177, 177, 1)];
    }
    return _subtitleLabel;
}

#pragma mark - styles

+ (CGFloat)height{
    return 85;
}

- (CGFloat)titleH{
    return 65.0;
}

- (CGFloat)titleW{
    return [DSDeviceUtil bounds].size.width - self.paddingLR*4 - self.paddingLR;
}

- (CGFloat)iconW{
    return self.paddingLR*2;
}

- (CGFloat)paddingLR{
    return 10;
}

- (CGFloat)paddingTB{
    return 10;
}

- (CGFloat)vSpace{
    return 0;
}

- (NSString *)iconName{
    return nil;
}

- (void)applyUnselectedStyle{
    
}

- (void)applySelectedStyle{
    
}

- (UIColor *)iconColor{
    return STYLE_THEME_COLOR_2;
}

@end
