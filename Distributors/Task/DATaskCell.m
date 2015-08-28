//
//  DAOpportunityTaskCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskCell.h"
#import "GlobalDefine.h"
#import "DAStyleDefine.h"
#import "DSDeviceUtil.h"
#import "DATask.h"

@interface DATaskCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DATaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview && self.isContentViewBlank) {
        [self.contentView addSubview:self.borderBottomViewStyleBlock];
        [self.contentView addSubview:self.titleLabel];
    }
}

#pragma mark - setters

- (void)setValue:(id)value{
    [super setValue:value];
    
    DATask *item = (DATask *)value;
    [self.titleLabel setText:[NSString stringWithFormat:@"%@", item.sentence]];
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

- (UIColor *)borderColor{
    return STYLE_BORDER_COLOR_DEFAULT;
}

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}

@end
