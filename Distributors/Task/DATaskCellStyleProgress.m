//
//  DAOpportunityTaskProgressCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskCellStyleProgress.h"
#import "GlobalDefine.h"
#import "AGLineProgressView.h"
#import "DSDeviceUtil.h"
#import "DSImage.h"
#import "DATask.h"
#import "DAStyleDefine.h"

@interface DATaskCellStyleProgress(){
    
}

@property (nonatomic, strong) UIImageView *iconView;


@property (nonatomic, strong) UIView *vBorderView;

@end

@implementation DATaskCellStyleProgress

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.titleView];
        [self.contentView addSubview:self.targetView];
        [self.contentView addSubview:self.progressView];
        [self.contentView addSubview:self.vBorderView];
        [self.contentView addSubview:self.currentView];
        [self.contentView addSubview:self.targetView];
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}

#pragma mark - setter

- (void)setValue:(id)value{
    [super setValue:value];
//    TLOG(@"value -> %@", value);
    DATask *item = (DATask *)value;
    [self.titleView setText:item.sentence];
    [self setValueForIconView];
}

- (void)setValueForIconView{
    DATask *item = (DATask *)self.value;
    UIImage *img = [[DAOpportunityCoordinator singleton] taskIconImageForTaskType:item.type];
//    TLOG(@"img -> %@", img);
    img = [DSImage image:img withMaskColor:STYLE_THEME_COLOR_2];
    [self.iconView setImage:img];
}

#pragma mark - components

- (UIImageView *)iconView{
    if (!_iconView) {
        CGFloat w = self.iconW;
        CGFloat h = w;
        CGFloat y = (self.height - h)/2.0;
        CGFloat x = y;
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
//        [_iconView setImage:img];
//        _iconView.layer.borderWidth = 1;
    }
    return _iconView;
}

- (UILabel *)titleView{
    if (!_titleView) {
        CGFloat x = self.height + self.paddingLR;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        CGFloat h = 36.0;
        CGFloat y = self.vSpace;
        _titleView = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _titleView.layer.borderWidth = 1;
        [_titleView setAdjustsFontSizeToFitWidth:YES];
        [_titleView setNumberOfLines:2];
    }
    return _titleView;
}

- (AGLineProgressView *)progressView{
    if (!_progressView) {
        CGFloat w = self.titleView.frame.size.width;
        CGFloat x = self.titleView.frame.origin.x;
        CGFloat y = self.titleView.frame.size.height + self.vSpace*2;
        CGFloat h = self.height - self.titleView.frame.size.height - self.vSpace*3;
        _progressView = [[AGLineProgressView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_progressView setInnerViewBackgroundColor:RGBA(112, 214, 104, 1)];
        [_progressView setTextColorOuter:RGBA(112, 214, 104, 1)];
//        _progressView set
        [_progressView assemble];
        [_progressView setProgress:[NSNumber numberWithFloat:.3f]];
    }
    return _progressView;
}

- (UIView *)vBorderView{
    if (!_vBorderView) {
        _vBorderView = [self borderViewInstance];
        [_vBorderView setFrame:CGRectMake(self.height, 0, 1, self.height)];
    }
    return _vBorderView;
}

- (UILabel *)currentView{
    if (!_currentView) {
        CGFloat w = self.height - 6;
        CGFloat x = [DSDeviceUtil bounds].size.width - self.height;
        CGFloat h = 30.0;
        CGFloat y = self.vSpace1;
        _currentView = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_currentView setFont:[AGStyleCoordinator fontWithSize:36.0]];
//        _currentView.layer.borderWidth = 1;
        [_currentView setText:@"3"];
        [_currentView setTextAlignment:NSTextAlignmentCenter];
    }
    return _currentView;
}

- (UILabel *)targetView{
    if (!_targetView) {
        CGFloat x = self.currentView.frame.origin.x;
        CGFloat y = self.currentView.frame.size.height + self.vSpace1*2;
        CGFloat h = self.height - self.currentView.frame.size.height - self.vSpace1*3;
        CGFloat w = self.currentView.frame.size.width;
        _targetView = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_targetView setAdjustsFontSizeToFitWidth:YES];
        [_targetView setTextAlignment:NSTextAlignmentCenter];
//        _targetView.layer.borderWidth = 1;
        [_targetView setNumberOfLines:2];
        [_targetView setText:@"3/10 by 09/12"];
    }
    return _targetView;
}

#pragma mark - styles

+ (CGFloat)height{
    return 68.0;
}

- (CGFloat)iconW{
    return 48;
}

- (CGFloat)vSpace{
    return 6.0;
}

- (CGFloat)vSpace1{
    return 3.0;
}

- (void)applySelectedStyle{
    
}

@end
