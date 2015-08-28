//
//  DAToolboxUnitView.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAToolboxUnitView.h"
#import "DAToolboxItem.h"
#import "DSImage.h"
#import "DAStyleDefine.h"

@interface DAToolboxUnitView(){
    
}

@property (nonatomic, strong) UILabel *titleView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UITapGestureRecognizer *gc;

@end

@implementation DAToolboxUnitView

//- (instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setUserInteractionEnabled:YES];
//    }
//    return self;
//}

- (void)setItem:(DAToolboxItem *)item{
    _item = item;
    [self assemble];
    
    [self.titleView setText:self.item.title];
    [self.iconView setImage:self.iconImage];
    [self.titleView setTextColor:self.color];
}

#pragma mark - 

- (void)addTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *gc = self.gc;
    [gc addTarget:target action:action];
    [self addGestureRecognizer:gc];
}


- (UITapGestureRecognizer *)gc{
    if (_gc) [self removeGestureRecognizer:_gc];
    _gc = [[UITapGestureRecognizer alloc] init];
    return _gc;
}

#pragma mark - components

- (void)assemble{
    [self addSubview:self.titleView];
    [self addSubview:self.iconView];
}

- (UILabel *)titleView{
    if (!_titleView) {
        CGFloat y = 3 + self.iconView.frame.size.height + self.iconView.frame.origin.y;
        CGFloat w = self.frame.size.width;
        CGFloat h = 12;
        _titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, y, w, h)];
//        _titleView.layer.borderWidth = 1;
        [_titleView setTextAlignment:NSTextAlignmentCenter];
        [_titleView setAdjustsFontSizeToFitWidth:YES];
        [_titleView setContentMode:UIViewContentModeScaleAspectFit];
        [_titleView setFont:[AGStyleCoordinator fontWithSize:10]];
        
    }
    return _titleView;
}

- (UIImageView *)iconView{
    if (!_iconView) {
        CGFloat w = self.iconH;
        CGFloat h = w;
        CGFloat x = (self.frame.size.width - w)/2.0;
        CGFloat y = 5;
        _iconView = [[UIImageView alloc] init];
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
        [_iconView setFrame:CGRectMake(x, y, w, h)];
        
//        _iconView.layer.borderWidth = 1;
        
    }
    
    return _iconView;
}

- (UIImage *)iconImage{
    if (!self.item.iconName) return nil;
    UIImage *img = [UIImage imageNamed:self.item.iconName];
    return [DSImage image:img withMaskColor:self.color];
}

#pragma mark - styles

- (UIColor *)color{
    if (self.hightlight) {
        return self.item.highlightColor;
    }
    return self.item.normalColor;
}

- (void)setHightlight:(BOOL)hightlight{
    _hightlight = hightlight;
    
    [self assemble];
}

- (CGFloat)iconH{
    return 28;
}

@end
