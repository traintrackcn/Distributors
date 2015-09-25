//
//  DATabBarCenterButtonContentView.m
//  Distributors
//
//  Created by Tao Yunfei on 9/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATabBarCenterButtonContentView.h"
#import "GlobalDefine.h"
#import "DAStyleDefine.h"
#import "RootTabController.h"
#import "DATabBarCenterButton.h"

@interface DATabBarCenterButtonContentView(){
    
}

//@property (nonatomic, strong) UIView *anchorView;

@end

@implementation DATabBarCenterButtonContentView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setWindowLevel:UIWindowLevelStatusBar+1];
        [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
//        [self setAlpha:0];
        [UIView animateWithDuration:STYLE_ANIMATION_INTERVAL animations:^{
            [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:.9]];
        }];
        
        
//        [self addSubview:self.anchorView];
        [self assmebleButtons];
        
        
        UITapGestureRecognizer *gc = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapButton:)];
        [self addGestureRecognizer:gc];
        
    }
    return self;
}

#pragma mark - interactive ops

- (void)didTapButton:(id)sender{
//    TLOG(@"");
    [[RootTabController singleton].centerButton removeContentView];
}


#pragma mark - 

- (void)assmebleButtons{
    
    NSArray *angles = @[@(M_PI_4) , @(M_PI_2), @(M_PI_2+ M_PI_4)];
    
    for (NSInteger i = 0; i < angles.count; i++) {
        UILabel *l = [self instanceCircleButton];
        [self addSubview:l];
        NSNumber *angle = [angles objectAtIndex:i];
        CGFloat y = sin(angle.floatValue)*self.r;
        CGFloat x = cos(angle.floatValue)*self.r;
        
        
        TLOG(@"x -> %f y -> %f", x, y);
        [l setText:[NSString stringWithFormat:@"Button%@",@(i)]];
        
        [l setCenter:self.basePoint];
        
        [UIView animateWithDuration:.33 animations:^{
            [l setCenter:CGPointMake(self.basePoint.x + x, self.basePoint.y - y)];
        }];
        
        
        
    }
    
    
}

- (UILabel *)instanceCircleButton{
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [l.layer setCornerRadius:l.frame.size.width/2.0];
    [l.layer setBorderWidth:.5f];
    [l setTextAlignment:NSTextAlignmentCenter];
    [l setText:@"Button"];
    [l setAdjustsFontSizeToFitWidth:YES];
    [l setBackgroundColor:[UIColor lightGrayColor]];
    [l setClipsToBounds:YES];
    [l setFont:[AGStyleCoordinator fontWithSize:13]];
    
//    UITapGestureRecognizer *gc = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapButton1:)];
//    [l addGestureRecognizer:gc];
//    [gc setCancelsTouchesInView:YES];
//    [l setUserInteractionEnabled:YES];
    
    return l;
    
}

- (void)didTapButton1:(id)sender{
    TLOG(@"");
}


#pragma mark - style

- (CGPoint)basePoint{
    return CGPointMake(STYLE_DEVICE_WIDTH/2.0, STYLE_DEVICE_HEIGHT - STYLE_TAB_BAR_HEIGHT);
}


- (CGFloat)r{
    return 60;
}

@end
