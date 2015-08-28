//
//  DSEarningPotentialPickerCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DSEarningPotentialPickerCell.h"
#import "DAEarningPotential.h"
#import "DSDeviceUtil.h"
#import "DATextDefine.h"
#import "DAStyleDefine.h"
#import "GlobalDefine.h"

@interface DSEarningPotentialPickerCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DSEarningPotentialPickerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview && self.isContentViewBlank) {
        [self.contentView addSubview:self.borderBottomViewStylePaddingLR];
        [self.contentView addSubview:self.titleLabel];
    }
}



#pragma mark - setters

- (void)setValue:(id)value{
    [super setValue:value];
    DAEarningPotential *item = (DAEarningPotential *)value;
    
    if (item) {
        NSString *text = [NSString stringWithFormat:@"%.2f ~ %.2f", item.min, item.max];
        [self.titleLabel setText:text];
    }
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFrame:CGRectMake(x, 0, w, self.height)];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
    }
    return _titleLabel;
}

#pragma mark - styles

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}

- (UIColor *)borderColor{
    return STYLE_BORDER_COLOR_DEFAULT;
}

@end
