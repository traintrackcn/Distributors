//
//  DACalendarListCell.m
//  Distributors
//
//  Created by Tao Yunfei on 9/8/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACalendarTodoCell.h"
#import "DAStyleDefine.h"
#import "DATextDefine.h"

@interface DACalendarTodoCell(){
    
}

@property (nonatomic, strong) UIView *dateViewContainer;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIView *contentContainer;
@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@property (nonatomic, strong) UILabel *startTimeLabel;
@property (nonatomic, strong) UILabel *endTimeLabel;

@end

@implementation DACalendarTodoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.dateViewContainer];
        [self.dateViewContainer addSubview:self.dateLabel];
        
        [self.contentView addSubview:self.contentContainer];
        [self.contentContainer addSubview:self.separatorView];
        [self.contentContainer addSubview:self.titleLabel];
        [self.contentContainer addSubview:self.subtitleLabel];
        
        [self.contentContainer addSubview:self.startTimeLabel];
        [self.contentContainer addSubview:self.endTimeLabel];
        
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
    }
    return self;
}

#pragma mark - components

- (UILabel *)startTimeLabel{
    if (!_startTimeLabel) {
        CGFloat y = self.titleLabel.frame.origin.y;
        CGFloat w = self.contentH - self.paddingLR;
        CGFloat h = self.titleLabel.frame.size.height;
        _startTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, w, h)];
        [_startTimeLabel setTextColor:STYLE_THEME_COLOR_2];
        [_startTimeLabel setText:@"12:00 PM"];
        [_startTimeLabel setFont:[AGStyleCoordinator fontWithSize:13.0]];
        [_startTimeLabel setTextAlignment:NSTextAlignmentRight];
    }
    return _startTimeLabel;
}

- (UILabel *)endTimeLabel{
    if (!_endTimeLabel) {
        CGFloat y = self.subtitleLabel.frame.origin.y;
        CGFloat w = self.contentH - self.paddingLR;
        CGFloat h = self.subtitleLabel.frame.size.height;
        _endTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, w, h)];
        [_endTimeLabel setTextColor:STYLE_TEXT_COLOR_SUBTITLE];
        [_endTimeLabel setText:@"8:00 PM"];
        [_endTimeLabel setFont:self.startTimeLabel.font];
        [_endTimeLabel setTextAlignment:NSTextAlignmentRight];
    }
    return _endTimeLabel;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR + self.contentH + self.separatorWidth;
        CGFloat w = self.titleW - self.paddingLR*2;
        CGFloat h = self.titleH;
        CGFloat y = self.paddingTB;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _titleLabel.layer.borderWidth = 1;
        [_titleLabel setText:@"Jazz coffee mixer 1"];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel{
    if (!_subtitleLabel) {
        CGFloat x = self.titleLabel.frame.origin.x;
        CGFloat y = self.vSpaceBetweenTitleAdnSubtitle + self.paddingTB + self.titleH;
        CGFloat h = self.subtitleH;
        CGFloat w = self.titleLabel.frame.size.width;
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _subtitleLabel.layer.borderWidth = 1;
        [_subtitleLabel setFont:[AGStyleCoordinator fontWithSize:13.0]];
        [_subtitleLabel setTextColor:STYLE_TEXT_COLOR_SUBTITLE];
        [_subtitleLabel setText:@"1235 Widwood Avenue, Sunnyvale"];
    }
    return _subtitleLabel;
}

- (UIView *)dateViewContainer{
    if (!_dateViewContainer) {
        CGFloat w = STYLE_DEVICE_WIDTH;
        CGFloat h = self.dateH;
        _dateViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        [_dateViewContainer setBackgroundColor:RGBA(245, 245, 245, 245)];
        [_dateViewContainer.layer setBorderColor:self.borderColor.CGColor];
        [_dateViewContainer.layer setBorderWidth:.5];
    }
    return _dateViewContainer;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        CGFloat x = self.paddingLR;
        CGFloat w = self.dateViewContainer.frame.size.width - x*2;
        CGFloat y = 0;
        CGFloat h = self.dateViewContainer.frame.size.height;
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_dateLabel setText:@"Tue Aug 28"];
    }
    return _dateLabel;
}

- (UIView *)contentContainer{
    if (!_contentContainer) {
        CGFloat y = self.dateViewContainer.frame.size.height;
        CGFloat w = STYLE_DEVICE_WIDTH;
        CGFloat h = self.contentH;
        _contentContainer = [[UIView alloc] initWithFrame:CGRectMake(0, y, w, h)];
//        _contentContainer.layer.borderWidth = 1;
    }
    return _contentContainer;
}

- (UIView *)separatorView{
    if (!_separatorView) {
        CGFloat x = self.contentContainer.frame.size.height;
        CGFloat h = x;
        _separatorView = [[UIView alloc] initWithFrame:CGRectMake(x, 0, self.separatorWidth, h)];
        [_separatorView setBackgroundColor:STYLE_THEME_COLOR];
    }
    return _separatorView;
}

#pragma mark - styles

- (void)applySelectedStyle{
    
}

+ (CGFloat)height{
    return 114;
}

- (CGFloat)paddingLR{
    return 15.0;
}

- (CGFloat)dateH{
    return 35.0;
}

- (CGFloat)contentH{
    return self.height - self.dateH;
}

- (CGFloat)titleW{
    return STYLE_DEVICE_WIDTH - self.contentH - self.separatorWidth;
}

- (CGFloat)separatorWidth{
    return 2.0;
}

- (CGFloat)titleH{
    return 20;
}

- (CGFloat)subtitleH{
    return 16;
}

- (CGFloat)vSpaceBetweenTitleAdnSubtitle{
    return 6.0;
}

- (CGFloat)paddingTB{
    return (self.contentH - self.titleH - self.subtitleH  - self.vSpaceBetweenTitleAdnSubtitle)/2.0;
}


- (UIColor *)borderColor{
    return STYLE_BORDER_COLOR_DEFAULT;
}

@end
