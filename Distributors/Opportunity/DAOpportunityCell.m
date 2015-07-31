//
//  DAOpportunityCell.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityCell.h"
#import "AGPortraitView.h"
#import "DSDeviceUtil.h"
#import "GlobalDefine.h"
#import "UILabel+AGUtil.h"

@interface DAOpportunityCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) AGPortraitView *creatorPortraitView;
@property (nonatomic, strong) UILabel *creatorNameLabel;
@property (nonatomic, strong) UIView *separatorBetweenTitleAndPortrait;
@property (nonatomic, strong) UILabel *rateLabel;

@end

@implementation DAOpportunityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        [self.contentView addSubview:self.separatorBetweenTitleAndPortrait];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.creatorPortraitView];
        [self.contentView addSubview:self.creatorNameLabel];
        [self.contentView addSubview:self.rateLabel];
    }
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR;
        CGFloat y = self.paddingTB;
        CGFloat w = (([DSDeviceUtil bounds].size.width - x*4)/3 ) * 2;
        CGFloat h = self.titleH;

        _titleLabel  = [[UILabel alloc] init];
        [_titleLabel setFrame:CGRectMake(x, y, w, h)];
        [_titleLabel setNumberOfLines:2];
//        _titleLabel.layer.borderWidth = 1;
        
        [_titleLabel setText:@"5 steps to become a top stylist with Stella"];
        
        [_titleLabel resizeWithMaxSize:CGSizeMake(w, h)];
    }
    return _titleLabel;
}

- (UIView *)separatorBetweenTitleAndPortrait{
    if (!_separatorBetweenTitleAndPortrait) {
        CGFloat x = self.titleW + self.vSpaceW*2;
        CGFloat y = self.paddingTB;
        CGFloat w = .5f;
        CGFloat h = self.titleH;
        _separatorBetweenTitleAndPortrait = [self borderViewInstance];
        [_separatorBetweenTitleAndPortrait setFrame:CGRectMake(x, y, w, h)];
    }
    return _separatorBetweenTitleAndPortrait;
}

- (AGPortraitView *)creatorPortraitView{
    if (!_creatorPortraitView) {
        CGFloat x = self.titleW + self.vSpaceW*3;
        CGFloat y = self.paddingTB;
        CGFloat w = self.portraitW;
        CGFloat h = self.portraitH;
        _creatorPortraitView = [[AGPortraitView alloc] init];
        [_creatorPortraitView setFrame:CGRectMake(x, y, w, h)];
        _creatorPortraitView.layer.borderWidth = 1;
    }
    return _creatorPortraitView;
}

- (UILabel *)creatorNameLabel{
    if (!_creatorNameLabel) {
        CGFloat x = self.titleW + self.vSpaceW*3;
        CGFloat y = self.creatorPortraitView.frame.size.height + self.creatorPortraitView.frame.origin.y;
        CGFloat w = self.portraitW;
        CGFloat h = self.titleH - self.portraitH;
        _creatorNameLabel = [[UILabel alloc] init];
        [_creatorNameLabel setAdjustsFontSizeToFitWidth:YES];
        [_creatorNameLabel setFrame:CGRectMake(x, y, w, h)];
        [_creatorNameLabel setTextAlignment:NSTextAlignmentCenter];
        _creatorNameLabel.layer.borderWidth = 1;
        [_creatorNameLabel setText:@"Creator Name"];
    }
    return _creatorNameLabel;
}

- (UILabel *)rateLabel{
    if (!_rateLabel) {
        CGFloat y = self.titleH;
        CGFloat h = 15;
        
        _rateLabel = [[UILabel alloc] init];
        [_rateLabel setFrame:CGRectMake(self.paddingLR, y, self.titleW, h)];
//        _rateLabel.layer.borderWidth = 1;
        [_rateLabel setAdjustsFontSizeToFitWidth:YES];
        [_rateLabel setText:@"★★★★☆"];
    }
    return _rateLabel;
}

#pragma mark - styles

+ (CGFloat)height{
    return 90;
}

- (void)applySelectedStyle{
    
}

- (CGFloat)paddingLR{
    return 15.0;
}

- (CGFloat)paddingTB{
    return 15.0;
}

- (CGFloat)vSpaceW{
    return self.paddingLR;
}

- (CGFloat)titleW{
    return (([DSDeviceUtil bounds].size.width - self.vSpaceW*4)/3 ) * 2;
}

- (CGFloat)portraitW{
    return self.titleW/2.0;
}

- (CGFloat)portraitH{
    return 40.0;
}

- (CGFloat)titleH{
    return 60;
}

- (CGFloat)contentH{
    return 85.0;
}


- (UIColor *)borderColor{
    return RGBA(221, 221, 221, 1);
}

@end
