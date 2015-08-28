//
//  DAButton.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAButton.h"
#import "DAStyleDefine.h"
#import "DSImage.h"

@interface DAButton(){
    
}

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, strong) UIView *vSeparator;

@property (nonatomic, assign) BOOL displayIcon;
@property (nonatomic, assign) BOOL displayText;

@end

@implementation DAButton

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title iconName:(NSString *)iconName{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title];
        [self setIconName:iconName];
        
        if (iconName) {
            [self setDisplayIcon:YES];
            [self addSubview:self.iconView];
            [self.iconView setImage:self.iconImage];
        }
        
        if (title) {
            if (![title isEqualToString:@""]) {
                [self setDisplayText:YES];
                [self addSubview:self.textLabel];
                [self.textLabel setText:self.title];
            }
            
        }
        
        [self addSubview:self.vSeparator];
        
    }
    return self;
}

- (void)setAlignLeft:(BOOL)alignLeft{
    _alignLeft = alignLeft;
    [self layoutSubviews];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.displayIcon && !self.displayText) {
        CGRect frame = self.iconView.frame;
        frame.origin = CGPointMake((self.frame.size.width - self.iconW)/2, frame.origin.y);
        [self.iconView setFrame:frame];
    }
    
    if (self.displayIcon && self.displayText) {
        CGRect textFrame = self.textLabel.frame;
        CGRect iconFrame = self.iconView.frame;
        CGFloat x = (self.frame.size.width - textFrame.size.width - iconFrame.size.width - self.space)/2.0;
        
        if (_alignLeft) x = 0;
        
        iconFrame.origin = CGPointMake(x, iconFrame.origin.y);
        [self.iconView setFrame:iconFrame];
        
        textFrame.origin = CGPointMake(x + self.iconW + self.space, textFrame.origin.y);
        [self.textLabel setFrame:textFrame];
        
    }
    
}

#pragma mark - 

- (UILabel *)textLabel{
    if (!_textLabel) {
        CGFloat w = self.titleW;
        CGFloat h = self.frame.size.height;
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, h)];
//        _textLabel.layer.borderWidth = 1;
        [_textLabel setTextColor:self.color];
        [_textLabel setFont:[AGStyleCoordinator fontWithSize:14]];
        [_textLabel setTextAlignment:NSTextAlignmentCenter];
        [_textLabel setAdjustsFontSizeToFitWidth:YES];
    }
    return _textLabel;
}

- (UIImageView *)iconView{
    if (!_iconView) {
        CGFloat w = self.iconW;
        CGFloat h = w;
        CGFloat y = (self.frame.size.height - h)/2.0;
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, y, w, h)];
//        _iconView.layer.borderWidth = 1;
    }
    return _iconView;
}

- (UIView *)vSeparator{
    if (!_vSeparator) {
        _vSeparator = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, 1, self.frame.size.height)];
        [_vSeparator setBackgroundColor:STYLE_BORDER_COLOR_DEFAULT];
    }
    return _vSeparator;
}

- (UIImage *)iconImage{
    UIImage *img = [UIImage imageNamed:self.iconName];
    return [DSImage image:img withMaskColor:self.color];
}


- (UIColor *)color{
    return RGBA(170, 170, 170, 1);
}

#pragma mark - styles

- (CGFloat)paddingLR{
    return 18;
}

- (CGFloat)iconW{
    return 15;
}

- (CGFloat)space{
    return 4;
}

- (CGFloat)titleW{
    return 40;
}

@end
