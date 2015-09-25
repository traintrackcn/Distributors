//
//  DACoversationCell.m
//  Distributors
//
//  Created by Tao Yunfei on 9/10/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAConversationCell.h"
#import "AGPortraitView.h"
#import "DAStyleDefine.h"

@interface DAConversationCell(){
    
}


@property (nonatomic, strong) AGPortraitView *portraitView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *indicatorView;
@property (nonatomic, strong) UILabel *timeLabel;


@end

@implementation DAConversationCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        [self.contentView addSubview:self.portraitView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subtitleLabel];
        [self.contentView addSubview:self.indicatorView];
        [self.contentView addSubview:self.timeLabel];
        
    }
    return self;
}


#pragma mark - components

- (AGPortraitView *)portraitView{
    //    if (!_portraitView) {
    if (!_portraitView) {
        CGFloat x = self.paddingLR;
        CGFloat y = (self.height - self.portraitH)/2.0;
        CGFloat w = self.portraitH;
        CGFloat h = self.portraitH;
        _portraitView = [[AGPortraitView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        //        _creatorPortraitView.layer.borderWidth = 1;
        
        //        _portraitView = [[AGPortraitView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_portraitView.imageView setImage:[UIImage imageNamed:@"nopic_mini.jpg"]];
    }
    return _portraitView;
    //    }
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.portraitH + self.paddingLR*2;
        CGFloat y = self.portraitView.frame.origin.y;
        CGFloat w = STYLE_DEVICE_WIDTH - x - self.paddingLR - self.timeW;
        CGFloat h = self.titleH;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _titleLabel.layer.borderWidth = 1;
        [_titleLabel setText:@"Blair Waldorf"];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel{
    if (!_subtitleLabel) {
        CGFloat h = self.subtitleH;
        CGFloat x = self.titleLabel.frame.origin.x;
        CGFloat y = (self.height - self.portraitView.frame.origin.y) - h - 4.0;
        CGFloat w = self.titleLabel.frame.size.width;
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _subtitleLabel.layer.borderWidth = 1;
        [_subtitleLabel setFont:[AGStyleCoordinator fontWithSize:14.0]];
        [_subtitleLabel setTextColor:STYLE_TEXT_COLOR_SUBTITLE];
        [_subtitleLabel setText:@"Sounds good."];
    }
    return _subtitleLabel;
}


- (UILabel *)indicatorView{
    if (!_indicatorView) {
        CGFloat w = self.indicatorH;
        CGFloat h = self.indicatorH;
        CGFloat x = STYLE_DEVICE_WIDTH - w - self.paddingLR;
        CGFloat y = (self.subtitleLabel.frame.origin.y + self.subtitleLabel.frame.size.height/2.0) - h/2.0;
        _indicatorView = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_indicatorView setTextColor:[UIColor whiteColor]];
        [_indicatorView setBackgroundColor:STYLE_INDICATOR_COLOR];
        [_indicatorView setTextAlignment:NSTextAlignmentCenter];
        [_indicatorView setAdjustsFontSizeToFitWidth:YES];
        [_indicatorView setFont:[AGStyleCoordinator fontWithSize:14]];
        [_indicatorView setText:@"1"];
        [_indicatorView setClipsToBounds:YES];
        [_indicatorView.layer setCornerRadius:w/2.0];
    }
    return _indicatorView;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        CGFloat w = self.timeW;
        CGFloat x = STYLE_DEVICE_WIDTH - self.paddingLR - w;
        CGFloat y = self.titleLabel.frame.origin.y;
        CGFloat h = 13.0;
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setFrame:CGRectMake(x, y, w, h)];
        [_timeLabel setFont:[AGStyleCoordinator fontWithSize:12]];
        [_timeLabel setText:@"00:00"];
        [_timeLabel setTextColor:STYLE_TEXT_COLOR_SUBTITLE];
        [_timeLabel setTextAlignment:NSTextAlignmentRight];
    }
    return _timeLabel;
}

#pragma mark - style

- (void)applySelectedStyle{
    
}

+ (CGFloat)height{
    return 65.0;
}

- (CGFloat)portraitH{
    return 48.0;
}

- (CGFloat)paddingLR{
    return 15.0;
}

- (CGFloat)timeW{
    return 40.0;
}

- (CGFloat)titleH{
    return 20;
}

- (CGFloat)subtitleH{
    return 16.0;
}

- (CGFloat)indicatorH{
    return 20.0;
}

@end
