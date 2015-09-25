//
//  DATabBarCenterButtonExtraView.m
//  Distributors
//
//  Created by Tao Yunfei on 9/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATabBarCenterButtonExtraView.h"
#import "DAStyleDefine.h"
#import "GlobalDefine.h"
#import "DSDraw.h"

@interface DATabBarCenterButtonExtraView(){
    
}

@property (nonatomic, strong) UIView *circleView;
@property (nonatomic, strong) UIView *circleViewBg;

@property (nonatomic, strong) UIView *cornerBL;
@property (nonatomic, strong) UIView *cornerBR;

@end

@implementation DATabBarCenterButtonExtraView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.circleViewBg];
        [self addSubview:self.circleView];
        
        //fix corner issue
        [self addSubview:self.cornerBL];
        [self addSubview:self.cornerBR];
        
        [self setClipsToBounds:YES];
//        self.layer.borderWidth = 1.0;
    }
    return self;
}

#pragma mark - components


-(UIView *)cornerBL{
    if (!_cornerBL) {
        CGFloat x = self.paddingLR;
        _cornerBL = [[UIView alloc] initWithFrame:CGRectMake(x, self.frame.size.height-.5f, .5f, .5)];
        [_cornerBL setBackgroundColor:STYLE_TAB_BAR_BORDER_COLOR];
    }
    return _cornerBL;
}

-(UIView *)cornerBR{
    if (!_cornerBR) {
        CGFloat x = self.frame.size.width - self.paddingLR - .5f;
        _cornerBR = [[UIView alloc] initWithFrame:CGRectMake(x, self.frame.size.height-.5f, .5f, .5)];
        [_cornerBR setBackgroundColor:STYLE_TAB_BAR_BORDER_COLOR];
    }
    return _cornerBR;
}

- (UIView *)circleView{
    if (!_circleView) {
        CGFloat x = - self.circleR + self.frame.size.width/2.0;
        CGFloat w = self.circleR*2 ;
        CGFloat h = w;
        _circleView = [[UIView alloc] initWithFrame:CGRectMake(x, .5f, w, h)];
        [_circleView setBackgroundColor:[UIColor whiteColor]];
        [_circleView.layer setCornerRadius:self.circleR];
        [_circleView.layer setBorderColor:STYLE_TAB_BAR_BORDER_COLOR.CGColor];
        [_circleView.layer setBorderWidth:.5f];
    }
    return _circleView;
}


- (UIView *)circleViewBg{
    if (!_circleViewBg) {
        CGFloat x = - self.circleR + self.frame.size.width/2.0;
        CGFloat w = self.circleR*2 ;
        CGFloat h = w;
        _circleViewBg = [[UIView alloc] initWithFrame:CGRectMake(x, 0, w, h)];
        [_circleViewBg setBackgroundColor:[UIColor whiteColor]];
        [_circleViewBg.layer setCornerRadius:self.circleR];
        [_circleViewBg.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_circleViewBg.layer setBorderWidth:.5f];
    }
    return _circleViewBg;
}

#pragma mark - styles

- (CGFloat)circleR{
    CGFloat y = self.frame.size.height;
    CGFloat w = (self.frame.size.width)/2.0- self.paddingLR;
    
    
    
    return (powf(y, 2)+ pow(w, 2))/(2*y);
}

- (CGFloat)paddingLR{
    return 8;
}

@end
