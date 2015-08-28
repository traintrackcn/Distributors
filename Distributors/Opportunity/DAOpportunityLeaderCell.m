//
//  DAOpportunityLeaderCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityLeaderCell.h"
#import "AGPortraitView.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"
#import "DALeaderViewController.h"

@interface DAOpportunityLeaderCell(){
    
}

@property (nonatomic, strong) AGPortraitView *portraitView;
@property (nonatomic, strong) UILabel *creatorNameLabel;
@property (nonatomic, strong) UILabel *companyLabel;
//@property (nonatomic, strong) UILabel *rateLabel;

@end

@implementation DAOpportunityLeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.portraitView];
        [self.contentView addSubview:self.creatorNameLabel];
        [self.contentView addSubview:self.companyLabel];
//        [self.contentView addSubview:self.rateLabel];
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        [self assembleGC];
//        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}

- (void)didTapCell{
    DALeaderViewController *vc= [DALeaderViewController instance];
    [self pushViewController:vc];
}

#pragma mark - components

- (AGPortraitView *)portraitView{
    if (!_portraitView) {
        CGFloat x = self.titleLabel.frame.origin.x;
        CGFloat h = self.portraitW;
        CGFloat w = h;
        CGFloat y = self.height - h - 5.0;
        _portraitView = [[AGPortraitView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_portraitView.imageView setImage:[UIImage imageNamed:@"nopic_mini.jpg"]];
    }
    
    return _portraitView;
}


- (UILabel *)creatorNameLabel{
    if (!_creatorNameLabel) {
        CGFloat h = 20;
        CGFloat x = self.portraitView.frame.size.width + self.portraitView.frame.origin.x + self.paddingLR;
        CGFloat y = self.portraitView.frame.origin.y + self.portraitView.frame.size.height/2.0 - h/2.0;
        CGFloat w = [DSDeviceUtil bounds].size.width - x - self.paddingLR;
        
        _creatorNameLabel = [[UILabel alloc] init];
        [_creatorNameLabel setAdjustsFontSizeToFitWidth:YES];
        [_creatorNameLabel setFrame:CGRectMake(x, y, w, h)];
//        [_creatorNameLabel setTextAlignment:NSTextAlignmentCenter];
        //        _creatorNameLabel.layer.borderWidth = 1;
        [_creatorNameLabel setText:@"Name"];
        [_creatorNameLabel setTextColor:RGBA(170, 170, 170, 1)];
        [_creatorNameLabel setFont:[AGStyleCoordinator fontWithSize:14.0]];
    }
    return _creatorNameLabel;
}

- (UILabel *)companyLabel{
    if (!_companyLabel) {
        CGFloat h = 20;
        CGFloat w = 100;
        CGFloat x = STYLE_DEVICE_WIDTH - w - self.paddingLR;
        CGFloat y = self.portraitView.frame.origin.y + self.portraitView.frame.size.height/2.0 - h/2.0;
        
        
        _companyLabel = [[UILabel alloc] init];
        [_companyLabel setAdjustsFontSizeToFitWidth:YES];
        [_companyLabel setFrame:CGRectMake(x, y, w, h)];
        //        [_creatorNameLabel setTextAlignment:NSTextAlignmentCenter];
        //        _creatorNameLabel.layer.borderWidth = 1;
        [_companyLabel setText:@"Company Name"];
        [_companyLabel setTextColor:STYLE_THEME_COLOR_2];
        [_companyLabel setFont:[AGStyleCoordinator fontWithSize:14.0]];
    }
    return _companyLabel;
}


#pragma mark - styles

- (CGFloat)labelH{
    return 40;
}

- (CGFloat)portraitW{
    return 26.0;
}

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}


@end
