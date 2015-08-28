//
//  DACircleNoteView.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACircleNoteView.h"
#import "DSImage.h"
#import "DAStyleDefine.h"

@interface DACircleNoteView(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *backgroundView;


@end

@implementation DACircleNoteView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self addSubview:self.backgroundView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setValue:(id)value{
    _value = value;
    [self.titleLabel setText:[NSString stringWithFormat:@"%@",value]];
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _titleLabel = [[UILabel alloc] initWithFrame:frame];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel.layer setCornerRadius:self.frame.size.width/2.0];
        [_titleLabel setBackgroundColor:self.backgroundColor];
        [_titleLabel setTextColor:self.textColor];
        [_titleLabel setClipsToBounds:YES];
    }
    return _titleLabel;
}



#pragma mark - styles

- (UIColor *)backgroundColor{
    return STYLE_THEME_COLOR;
}

- (UIColor *)textColor{
    return [UIColor whiteColor];
}

@end
