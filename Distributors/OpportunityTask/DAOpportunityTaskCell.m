//
//  DAOpportunityTaskCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTaskCell.h"
#import "GlobalDefine.h"
#import "DAStyleDefine.h"
#import "DSDeviceUtil.h"
#import "DAOpportunityTask.h"

@interface DAOpportunityTaskCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DAOpportunityTaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
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
    
    DAOpportunityTask *item = (DAOpportunityTask *)value;
    [self.titleLabel setText:[NSString stringWithFormat:@" - %@", item.sentence]];
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
    return DEFAULT_BORDER_COLOR;
}

- (CGFloat)paddingLR{
    return DEFAULT_PADDING_LR;
}

@end
