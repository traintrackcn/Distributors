//
//  DAStepHeaderView.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAStepHeaderView.h"
#import "DACircleNoteView.h"
#import "DAStyleDefine.h"
#import "DAButton.h"

@interface DAStepHeaderView(){
    
}

@property (nonatomic, strong) DACircleNoteView *numberView;
@property (nonatomic, strong) UILabel *titleView;
@property (nonatomic, strong) DAButton *countdownView;

@end

@implementation DAStepHeaderView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.borderBottomView];
        [self addSubview:self.numberView];
        [self addSubview:self.titleView];
        [self addSubview:self.countdownView];
    }
    return self;
}

#pragma mark - setters

- (void)setValue:(id)value{
    
    if ([value isKindOfClass:[NSArray class]]) {
        NSArray *arr = (NSArray *)value;
        [self.numberView setValue:arr.firstObject];
        [self.titleView setText:arr.lastObject];
    }
    
    
}

#pragma mark - components

- (DAButton *)countdownView{
    if (!_countdownView) {
        CGFloat x = self.titleView.frame.origin.x;
        CGFloat y = self.titleView.frame.origin.y + self.titleView.frame.size.height;
        CGFloat w = self.titleView.frame.size.width;
        CGFloat h = 20.0;
        _countdownView = [[DAButton alloc] initWithFrame:CGRectMake(x, y, w, h) title:@"3 days" iconName:@"IconClock"];
        [_countdownView setAlignLeft:YES];
    }
    return _countdownView;
}

- (UILabel *)titleView{
    if (!_titleView) {
        CGFloat x = self.numberAreaW + 4;
        CGFloat w = [DSDeviceUtil bounds].size.width - x -self.paddingLR;
        CGFloat h = 50;
        CGFloat y = self.vSpace;
        _titleView = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
//                _titleView.layer.borderWidth = 1;
        [_titleView setAdjustsFontSizeToFitWidth:YES];
        [_titleView setNumberOfLines:2];
    }
    return _titleView;
}

- (DACircleNoteView *)numberView{
    if (!_numberView) {
        CGFloat w = self.numberW;
        CGFloat h = w;
        CGFloat x = (self.numberAreaW - w)/2.0;
        TLOG(@"self.height -> %f", self.height);
        CGFloat y = (self.height - h)/2.0;
        _numberView = [[DACircleNoteView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    }
    return _numberView;
}

#pragma mark - styles

+ (CGFloat)height{
    return 95.0;
}

- (CGFloat)numberW{
    return 30.0;
}

- (CGFloat)numberAreaW{
    return 68.0;
}

- (CGFloat)paddingLR{
    return 15;
}

- (CGFloat)vSpace{
    return 6.0;
}

- (CGFloat)vSpace1{
    return 3.0;
}

@end
