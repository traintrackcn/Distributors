//
//  DADownlineProgressCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADownlineProgressCell.h"
#import "AGPortraitView.h"
#import "AGLineProgressView.h"
#import "DSDeviceUtil.h"
#import "GlobalDefine.h"
#import "DAStyleDefine.h"
#import "DSImage.h"

@interface DADownlineProgressCell(){
    
}

@property (nonatomic, strong) AGPortraitView *portraitView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *percentLabel;
@property (nonatomic, strong) AGLineProgressView *progressView;
@property (nonatomic, strong) UIImageView *emailButton;
@property (nonatomic, strong) UIImageView *phoneButton;

@end

@implementation DADownlineProgressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        [self.contentView addSubview:self.portraitView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.percentLabel];
        [self.contentView addSubview:self.progressView];
        
        [self.contentView addSubview:self.emailButton];
        [self.contentView addSubview:self.phoneButton];
    }
    return self;
}

#pragma mark - interactive ops

- (void)didTapEmail:(id)sender{
    
}

- (void)didTapPhone:(id)sender{
    
}

#pragma mark - components


- (UILabel *)nameLabel{
    if (!_nameLabel) {
        CGFloat x = self.portraitView.frame.size.width + self.portraitView.frame.origin.x + 15;
        CGFloat w = [DSDeviceUtil bounds].size.width - x;
        CGFloat h = 36.0;
        CGFloat y = self.portraitView.frame.origin.y;
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        //        _titleView.layer.borderWidth = 1;
        [_nameLabel setAdjustsFontSizeToFitWidth:YES];
        [_nameLabel setNumberOfLines:2];
        [_nameLabel setText:@"Name"];
    }
    return _nameLabel;
}

- (AGPortraitView *)portraitView{
//    if (!_portraitView) {
        if (!_portraitView) {
            CGFloat x = self.paddingLR;
            CGFloat y = self.paddingTB;
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

- (AGLineProgressView *)progressView{
    if (!_progressView) {
        CGFloat x = self.paddingLR;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        CGFloat y = self.portraitView.frame.size.height + self.portraitView.frame.origin.y + self.vSpace;
        CGFloat h = 16;
        _progressView = [[AGLineProgressView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_progressView setInnerViewBackgroundColor:RGBA(112, 214, 104, 1)];
        [_progressView setTextColorOuter:RGBA(112, 214, 104, 1)];
        //        _progressView set
        [_progressView assemble];
        [_progressView setProgress:[NSNumber numberWithFloat:.6f]];
    }
    return _progressView;
}


- (UIImageView *)emailButton{
    if (!_emailButton) {
        CGFloat w = 32;
        CGFloat h = w;
        CGFloat x = [DSDeviceUtil bounds].size.width - w - self.paddingLR;
        CGFloat y = self.phoneButton.frame.origin.y;
        _emailButton = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        
        [_emailButton setUserInteractionEnabled:YES];
        [_emailButton setContentMode:UIViewContentModeScaleAspectFit];
        
        UIColor *color = [AGStyleCoordinator colorTheme];
        UIImage *img = [UIImage imageNamed:@"IconEmail"];
        img = [DSImage image:img withMaskColor:color];
        [_emailButton setImage:img];
        
        UITapGestureRecognizer *gc = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapEmail:)];
        
        [_emailButton addGestureRecognizer:gc];
    }
    
    
    
    return _emailButton;
}

- (UIImageView *)phoneButton{
    if (!_phoneButton) {
        CGFloat w = 32;
        CGFloat h = w;
        CGFloat x = [DSDeviceUtil bounds].size.width - w*2 - self.paddingLR*2;
        CGFloat y = self.paddingTB + self.portraitView.frame.size.height/2.0 - h/2;
        _phoneButton = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_phoneButton setContentMode:UIViewContentModeScaleAspectFit];
        
        //        [AGDebugUtil makeBorderForView:_phoneButton];
        [_phoneButton setUserInteractionEnabled:YES];
        UITapGestureRecognizer *gc = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPhone:)];
        
        
        UIColor *color = [AGStyleCoordinator colorTheme];
        UIImage *img = [UIImage imageNamed:@"IconPhone"];
        img = [DSImage image:img withMaskColor:color];
        [_phoneButton setImage:img];
        
        [_phoneButton addGestureRecognizer:gc];
    }
    
    
    
    return _phoneButton;
}

#pragma mark - styles

+ (CGFloat)height{
    return 86;
}

- (CGFloat)portraitH{
    return 48.0;
}

- (CGFloat)vSpace{
    return 6;
}

- (CGFloat)paddingLR{
    return 15.0;
}

@end
