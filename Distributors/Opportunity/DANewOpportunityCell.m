//
//  DANewOpportunityCell.m
//  Distributors
//
//  Created by Tao Yunfei on 9/1/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

//
//  DAOpportunityNewStepCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DANewOpportunityCell.h"
#import "DAStyleDefine.h"
#import "DATextDefine.h"
//#import "DAStep.h"
#import "DSImage.h"

#import "DAOpportunityCoordinator.h"

@interface DANewOpportunityCell(){
    
}

@property (nonatomic, strong) UIImageView *buttonView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *bgView;

@end

@implementation DANewOpportunityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bgView];
        [self.contentView addSubview:self.buttonView];
        [self.contentView addSubview:self.titleLabel];
        [self assembleGC];
    }
    return self;
}

#pragma mark - interactive ops

- (void)didTapCell{
    [self dispatchRequestAction:nil];
}

#pragma mark - components

- (UIImageView *)bgView{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, self.height)];
        [_bgView setContentMode:UIViewContentModeScaleAspectFill];
        [_bgView setImage:[UIImage imageNamed:@"CellBackground2.jpg"]];
        [_bgView setAlpha:.3];
    }
    return _bgView;
}

- (UIImageView *)buttonView{
    if (!_buttonView) {
        CGFloat w = 100;
        CGFloat h = w;
        CGFloat x = ([DSDeviceUtil bounds].size.width - w)/2.0;
        CGFloat y = ((self.height - h)/5.0)*2.0;
        _buttonView  = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_buttonView setImage:self.buttonImage];
        //        _buttonView.layer.borderWidth = 1;
        
    }
    return _buttonView;
}

- (UIImage *)buttonImage{
    UIImage *img = [UIImage imageNamed:@"ButtonLargeAdd"];
    img = [DSImage image:img withMaskColor:STYLE_THEME_COLOR_2];
    return img;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat w = STYLE_DEVICE_WIDTH;
        CGFloat h = 20;
        CGFloat y = self.buttonView.frame.size.height + self.buttonView.frame.origin.y + 6;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, w, h)];
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:13.0]];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:STYLE_THEME_COLOR_2];
        [_titleLabel setText:[AGTextCoordinator textForKey:KEY_MSG_ADD_AN_OPPORTUNITY]];
    }
    return _titleLabel;
}

#pragma mark - style

+ (CGFloat)height{
    return [DSDeviceUtil bounds].size.height - STYLE_NAVIGATION_BAR_HEIGHT - STYLE_STATUS_BAR_HEIGHT;
}

- (void)applySelectedStyle{
    
}

@end