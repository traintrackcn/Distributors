//
//  DAOpportunityNewStepCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DANewStepCell.h"
#import "DAStyleDefine.h"
#import "DATextDefine.h"
#import "DAStepEditor.h"
#import "DAStep.h"
#import "DSImage.h"

#import "DAOpportunityCoordinator.h"

@interface DANewStepCell(){
    
}

@property (nonatomic, strong) UIImageView *buttonView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DANewStepCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.buttonView];
        [self.contentView addSubview:self.titleLabel];
        [self assembleGC];
    }
    return self;
}

#pragma mark - interactive ops

- (void)didTapCell{
    
    [[DAOpportunityCoordinator singleton] resetStepInstance];
    
    DAStepEditor *vc = [DAStepEditor instance];
    [vc setItem:[DAOpportunityCoordinator singleton].stepInstance];
    [self pushViewController:vc];
}

#pragma mark - components

- (UIImageView *)buttonView{
    if (!_buttonView) {
        CGFloat w = 100;
        CGFloat h = w;
        CGFloat x = ([DSDeviceUtil bounds].size.width - w)/2.0;
        CGFloat y = (self.height - h)/2.0;
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
        [_titleLabel setText:[AGTextCoordinator textForKey:KEY_MSG_ADD_YOUR_FIRST_STEP]];
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
