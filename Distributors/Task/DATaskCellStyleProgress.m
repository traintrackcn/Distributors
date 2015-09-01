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
@property (nonatomic, strong) UILabel *targetView;
@property (nonatomic, strong) UILabel *currentView;

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
        [self.contentView addSubview:self.moreStatusContainer];
        [self.moreStatusContainer addSubview:self.currentView];
        [self.moreStatusContainer addSubview:self.targetView];
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        
//        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
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
    [self setValueForProgressView];
    
    [self setValueForProgressTextView];
}

- (void)setValueForIconView{
    
    DATask *item = (DATask *)self.value;
    UIImage *img = [[DATaskDefine singleton] iconImageForTaskType:item.type];
//    TLOG(@"section -> %d", self.indexPath.section);
     img = [DSImage image:img withMaskColor:STYLE_THEME_COLOR_2];
    
    
    //for demo only
//    NSInteger section = self.indexPath.section;
    if (item.isCompleted) { //SectionCompleted
        img = [UIImage imageNamed:@"IconCheckMark"];
        img = [DSImage image:img withMaskColor:STYLE_COLOR_COMPLETED];
    }
    
    
//    TLOG(@"img -> %@", img);
   
    [self.iconView setImage:img];
}

- (void)setValueForProgressView{
    DATask *item = (DATask *)self.value;
    [self.progressView setProgress:[NSNumber numberWithFloat:item.progress]];
}


- (void)setValueForProgressTextView{
    DATask *item = (DATask *)self.value;
    DATaskType type = item.type;
    
    
    
    if (type == DATaskTypeTestimonial
        || type == DATaskTypeOthers) {
        [self.currentView setHidden:YES];
        [self.targetView setHidden:YES];
    }else{
        [self.currentView setHidden:NO];
        [self.targetView setHidden:NO];
        
        [self.currentView setText:[NSString stringWithFormat:@"%.0f", self.currentValue]];
        [self.targetView setText:[NSString stringWithFormat:@"%.0f by 09/12", self.targetValue]];
    }
    
    
    
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
        CGFloat h = self.height - self.titleView.frame.size.height - self.vSpace*3 - 10;
        _progressView = [[AGLineProgressView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_progressView setInnerViewBackgroundColor:STYLE_COLOR_COMPLETED];
        [_progressView setTextColorOuter:STYLE_COLOR_COMPLETED];
        [_progressView setShowTextLabel:NO];
        [_progressView setCornerRadius:4.0];
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


- (UIView *)moreStatusContainer{
    if (!_moreStatusContainer) {
        CGFloat x = [DSDeviceUtil bounds].size.width - self.height;
        CGFloat y = 0;
        CGFloat w = self.height - 6;
        CGFloat h = self.height;
        _moreStatusContainer = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _moreStatusContainer.layer.borderWidth = 1;
    }
    return _moreStatusContainer;
}

- (UILabel *)currentView{
    if (!_currentView) {
        CGFloat w = self.moreStatusContainer.frame.size.width;
        CGFloat x = 0;
        CGFloat h = 30.0;
        CGFloat y = self.vSpace1;
        _currentView = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_currentView setFont:[AGStyleCoordinator fontWithSize:18]];
//        _currentView.layer.borderWidth = 1;
//        [_currentView setText:@"3"];
        [_currentView setTextAlignment:NSTextAlignmentCenter];
        [_currentView setTextColor:STYLE_COLOR_COMPLETED];
    }
    return _currentView;
}

- (UILabel *)targetView{
    if (!_targetView) {
        CGFloat x = 0;
        CGFloat y = self.currentView.frame.size.height + self.vSpace1*2;
        CGFloat h = self.height - self.currentView.frame.size.height - self.vSpace1*3;
        CGFloat w = self.moreStatusContainer.frame.size.width;
        _targetView = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_targetView setAdjustsFontSizeToFitWidth:YES];
        [_targetView setTextAlignment:NSTextAlignmentCenter];
//        _targetView.layer.borderWidth = 1;
        [_targetView setNumberOfLines:2];
//        [_targetView setText:@"3/10 by 09/12"];
        [_targetView setTextColor:[UIColor lightGrayColor]];
        
    }
    return _targetView;
}

#pragma mark - demo dates

- (CGFloat)targetValue{
    return 10.0;
}

- (CGFloat)currentValue{
    DATask *item = (DATask *)self.value;
    return self.targetValue * item.progress;
}

#pragma mark - styles

+ (CGFloat)height{
    return 68.0;
}

- (CGFloat)iconW{
    return 48;
}

- (CGFloat)vSpace{
    return 4;
}

- (CGFloat)vSpace1{
    return 3.0;
}

- (void)applySelectedStyle{
    
}

@end
