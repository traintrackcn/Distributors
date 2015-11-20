//
//  DATabBarCenterButton.m
//  CustomTabBar
//
//  Created by Tao Yunfei on 9/18/15.
//  Copyright (c) 2015 Walt Disney Company. All rights reserved.
//

#import "DATabBarCenterButton.h"
#import "DAStyleDefine.h"
#import "DATabBarCenterButtonExtraView.h"
#import "DATabBarCenterButtonContentView.h"

@interface DATabBarCenterButton(){
    
}

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) DATabBarCenterButtonContentView *contentView;
@property (nonatomic, strong) DATabBarCenterButtonExtraView *extraBackgroundView;
@property (nonatomic, weak) UITabBarController *tabBarController;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation DATabBarCenterButton




- (instancetype)initWithFrame:(CGRect)frame tabBarController:(UITabBarController *)tabBarController{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTabBarController:tabBarController];
        [self addGestureRecognizer:self.tapGestureRecognizer];
        [self adjustPosition];
        
        [self addSubview:self.extraBackgroundView];
        [self addSubview:self.button];
        [self addSubview:self.maskView];
    }
    return self;
}

#pragma mark - interactive ops

- (void)didTapButton:(id)sender{
    if (self.tabBarController.selectedIndex == self.index && _contentView) return;
    
    NSLog(@"self.index -> %ld", (long)self.index);
    [self.tabBarController setSelectedIndex:self.index];
    [self setSelected:YES];
}

#pragma mark - components

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapButton:)];
    }
    return _tapGestureRecognizer;
}

- (UIButton *)button{
    if (!_button) {
        
        CGFloat w = 23;
        CGFloat x = (self.frame.size.width - w)/2.0;
        CGFloat h = 33;
        CGFloat y = self.paddingT;
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:CGRectMake(x, y, w, h)];
        [_button.imageView setContentMode:UIViewContentModeScaleAspectFit];
//        _button.layer.borderWidth = 1;
    }
    return _button;
}

- (UIView *)maskView{
    if (!_maskView) {
        CGFloat w = self.frame.size.width;
        CGFloat h = self.frame.size.height;
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    }
    return _maskView;
}

- (DATabBarCenterButtonContentView *)contentView{
    if (!_contentView) {
        _contentView = [[DATabBarCenterButtonContentView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, STYLE_DEVICE_HEIGHT - STYLE_TAB_BAR_HEIGHT)];
        
    }
    return _contentView;
}

- (DATabBarCenterButtonExtraView *)extraBackgroundView{
    if (!_extraBackgroundView) {
        CGFloat w = self.frame.size.width;
        CGFloat h = self.offsetH;
        _extraBackgroundView = [[DATabBarCenterButtonExtraView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
//        [_extraBackgroundView setBackgroundColor:[UIColor whiteColor]];
    }
    return _extraBackgroundView;
}

#pragma mark - styles

- (void)adjustPosition{
    UITabBar *tabBar = self.tabBarController.tabBar;
//    CGFloat heightDifference = self.frame.size.height - tabBar.frame.size.height;
    if (self.offsetH < 0) {
        self.center = tabBar.center;
    } else {
        CGPoint center = tabBar.center;
        center.y = center.y - self.offsetH/2.0;
        self.center = center;
    }
}

- (CGFloat)buttonH{
    return self.frame.size.height;
}

- (CGFloat)paddingLR{
    return 3.0;
}

- (CGFloat)paddingT{
    return 10.0;
}

- (CGFloat)paddingB{
    return 3.0;
}

- (CGFloat)offsetH{
    UITabBar *tabBar = self.tabBarController.tabBar;
    return self.frame.size.height - tabBar.frame.size.height;
}

#pragma mark - properties

- (NSInteger)index{
    return floor(self.tabBarController.viewControllers.count/2.0);
}


- (void)setSelected:(BOOL)selected{
    [self.button setSelected:selected];
//    return;
//    if (selected) {
//        [self appendContentView];
//    }else{
//        [self removeContentView];
//    }
}

- (void)setNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage{
    [self.button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self.button setBackgroundImage:highlightImage forState:UIControlStateSelected];
//    [self setBackgroundImage:highlightImage forState:UIControlStateDisabled];
    [self.button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
}


#pragma mark - 

- (void)appendContentView{
    TLOG(@"self.tabBarController.views -> %@", self.tabBarController.view.subviews);
    [self.tabBarController.view insertSubview:self.contentView atIndex:1];
//    [self.contentWin makeKeyAndVisible];
}

- (void)removeContentView{
    if (_contentView) [_contentView removeFromSuperview];
    _contentView = nil;
}



@end
