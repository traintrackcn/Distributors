//
//  DAOpportunityCell.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DALeaderOpportunityCell.h"
#import "AGPortraitView.h"
//#import "DSDeviceUtil.h"
#import "GlobalDefine.h"
#import "UILabel+AGUtil.h"
#import "DAStyleDefine.h"
#import "DAButton.h"
#import "AGViewController.h"

@interface DALeaderOpportunityCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) AGPortraitView *creatorPortraitView;
//@property (nonatomic, strong) UILabel *companyNameLabel;
@property (nonatomic, strong) UIImageView *companyLogoView;
@property (nonatomic, strong) UIView *buttonContainer;
@property (nonatomic, strong) UILabel *creatorLabel;
@property (nonatomic, strong) UILabel *followerNumLabel;

@end

@implementation DALeaderOpportunityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        
        [self.contentView addSubview:self.backgroundView];
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        //        [self.contentView addSubview:self.separatorBetweenTitleAndPortrait];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.creatorPortraitView];
        [self.contentView addSubview:self.companyLogoView];
        [self.contentView addSubview:self.followerNumLabel];
        //        [self.contentView addSubview:self.rateLabel];
        [self.contentView addSubview:self.creatorLabel];
        
        [self.contentView addSubview:self.buttonContainer];
        
        
        
        [self assembleButtons];
        
    }
    return self;
}

- (void)setValue:(id)value{
    [super setValue:value];
    
    [self.titleLabel setText:[NSString stringWithFormat:@"%@", value]];
    
    [self.creatorPortraitView.imageView setImage:self.demoPortraitImage];
    [self.creatorLabel setText:self.demoCreatorName];
}


#pragma mark - components

- (UIView *)backgroundView{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, 100)];
    [imgV setContentMode:UIViewContentModeScaleAspectFill];
    [imgV setImage:[UIImage imageNamed:@"CellBackground1"]];
    return imgV;
}

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

- (AGPortraitView *)creatorPortraitView{
    if (!_creatorPortraitView) {
        CGFloat x = self.titleW + self.vSpaceW*3+ (self.portraitW - self.portraitH)/2.0;
        CGFloat y = 10;
        CGFloat w = self.portraitH;
        CGFloat h = self.portraitH;
        _creatorPortraitView = [[AGPortraitView alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _creatorPortraitView.layer.borderWidth = 1;
        
//        _portraitView = [[AGPortraitView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_creatorPortraitView.imageView setImage:[UIImage imageNamed:@"nopic_mini.jpg"]];
    }
    return _creatorPortraitView;
}

- (UILabel *)creatorLabel{
    if (!_creatorLabel) {
        CGFloat x = self.creatorPortraitView.frame.origin.x;
        CGFloat y = self.creatorPortraitView.frame.origin.y + self.creatorPortraitView.frame.size.height + 5;
        CGFloat w = self.creatorPortraitView.frame.size.width;
        CGFloat h = 15;
        _creatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_creatorLabel setTextAlignment:NSTextAlignmentCenter];
        [_creatorLabel setTextColor:RGBA(170, 170, 170, 1)];
        [_creatorLabel setText:@"Name"];
        [_creatorLabel setAdjustsFontSizeToFitWidth:YES];
    }
    return _creatorLabel;
}

- (UIImageView *)companyLogoView{
    if (!_companyLogoView) {
        CGFloat h = 24;
        CGFloat x = self.paddingLR;
        CGFloat y = self.backgroundView.frame.size.height - h - 7;
        CGFloat w = h;
        
        _companyLogoView = [[UIImageView alloc] init];
        [_companyLogoView setFrame:CGRectMake(x, y, w, h)];
//        [_creatorNameLabel setTextAlignment:NSTextAlignmentCenter];
        [_companyLogoView setContentMode:UIViewContentModeScaleAspectFit];
//        _companyLogoView.layer.borderWidth = 1;
//        [_companyNameLabel setText:@"Company"];
//        [_companyNameLabel setTextColor:STYLE_THEME_COLOR_2];
        [_companyLogoView setImage:[UIImage imageNamed:@"LogoOGTiny"]];
    }
    return _companyLogoView;
}

- (UILabel *)followerNumLabel{
    if (!_followerNumLabel) {
        CGFloat x = self.companyLogoView.frame.size.width + self.companyLogoView.frame.origin.x + 5;
        CGFloat y = self.companyLogoView.frame.origin.y;
        CGFloat w = STYLE_DEVICE_WIDTH;
        CGFloat h = self.companyLogoView.frame.size.height;
        _followerNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_followerNumLabel setText:@"Follower: 22"];
        [_followerNumLabel setTextColor:[UIColor lightGrayColor]];
    }
    return _followerNumLabel;
}

- (UIView *)buttonContainer{
    if (!_buttonContainer) {
        CGFloat h = 40;
        CGFloat w = STYLE_DEVICE_WIDTH;
        CGFloat y = self.backgroundView.frame.size.height;
        _buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, y, w, h)];
        [_buttonContainer setBackgroundColor:[UIColor whiteColor]];
//        _buttonContainer.layer.borderWidth = 1;
    }
    return _buttonContainer;
}

- (void)assembleButtons{
    NSArray *icons = @[@"IconComment", @"IconFav", @"IconShare"];
    NSArray *titles = @[@"2", @"4", @""];
    CGFloat num = icons.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.buttonContainer.frame.size.width/num;
    CGFloat h = self.buttonContainer.frame.size.height;
    for (NSInteger i = 0; i < 3; i++) {
        NSString *title = [titles objectAtIndex:i];
        NSString *iconName = [icons objectAtIndex:i];
        CGRect frame = CGRectMake(x, y, w, h);
        DAButton *btn = [[DAButton alloc] initWithFrame:frame title:title iconName:iconName];
        [self.buttonContainer addSubview:btn];
        x += w;
        
        
        if (i == 2) {
            UITapGestureRecognizer *gc = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapShared:)];
            [btn addGestureRecognizer:gc];
        }
    }
}


#pragma mark - interactive ops

- (void)didTapShared:(id)sender{
    NSString *textToShare = @"It's a great opportunity!";
    NSURL *myWebsite = [NSURL URLWithString:@"http://www.abovegem.com/"];
    
    NSArray *objectsToShare = @[textToShare, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypePostToFacebook,
                                   UIActivityTypePostToTwitter
                                   ];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    
    [(AGViewController *)self.associatedViewController presentViewController:activityVC animated:YES completion:nil];
//    [self pushViewController:activityVC];
}


#pragma mark - demo data

- (NSString *)demoPortraitName{
    NSInteger i = self.indexPath.row;
    id value = @"nopic_mini.jpg";
    if (i == 0) {
        value = @"DemoP1.jpg";
    }else if (i == 1){
        value = @"DemoP2.jpg";
    }else if (i == 2){
        value = @"DemoP3.jpg";
    }
    return value;
}

- (UIImage *)demoPortraitImage{
    return [UIImage imageNamed:self.demoPortraitName];
}

- (NSString *)demoCreatorName{
    NSInteger i = self.indexPath.row;
    id value = @"Name";
    if (i == 0) {
        value = @"Mike Jeson";
    }else if (i == 1){
        value = @"Lucy";
    }else if (i == 2){
        value = @"Ella";
    }
    return value;
}


#pragma mark - styles

+ (CGFloat)height{
    return 150;
}

- (void)applySelectedStyle{
    
}

- (void)applyUnselectedStyle{
    
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
    return 60;
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
