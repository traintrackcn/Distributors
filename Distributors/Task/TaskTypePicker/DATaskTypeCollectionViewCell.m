//
//  DATaskTypeCollectionViewCell.m
//  Distributors
//
//  Created by Tao Yunfei on 9/25/15.
//  Copyright © 2015 AboveGEM. All rights reserved.
//

#import "DATaskTypeCollectionViewCell.h"
#import "DATaskTypeItem.h"
#import "GlobalDefine.h"
#import "DAStyleDefine.h"

@interface DATaskTypeCollectionViewCell(){
    
}

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DATaskTypeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.titleLabel];
        
//        self.layer.borderWidth = 1;
    }
    return self;
}


#pragma mark - setters

- (void)setValue:(id)value{
    [super setValue:value];
//    TLOG(@"value -> %@", value)
    DATaskTypeItem *item = value;
    [self.iconView setImage:item.iconImage];
    [self.titleLabel setText:item.title];
}

#pragma mark - components

- (UIImageView *)iconView{
    if (!_iconView) {
        CGFloat w = 60.0;
        CGFloat h = w;
        CGFloat x = (self.frame.size.width - w)/2.0;
        CGFloat y = 15.0;
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _iconView.layer.borderWidth = 1;
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _iconView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat h = 18.0;
        CGFloat w = self.frame.size.width;
        CGFloat y = self.iconView.frame.origin.y + self.iconView.frame.size.height + 12;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, w, h)];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
//        _titleLabel.layer.borderWidth = 1;
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:16.0]];
        [_titleLabel setTextColor:STYLE_TEXT_COLOR_SUBTITLE];
    }
    return _titleLabel;
}

@end
