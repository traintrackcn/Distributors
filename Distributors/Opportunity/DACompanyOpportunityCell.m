//
//  DACompanyOpportunityCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/26/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACompanyOpportunityCell.h"
#import "AGPortraitView.h"
#import "DSDeviceUtil.h"
#import "GlobalDefine.h"
#import "UILabel+AGUtil.h"
#import "DAStyleDefine.h"
#import "DAStyleDefine.h"
#import "DAOpportunityDataset.h"
#import "DAOpportunity.h"

@interface DACompanyOpportunityCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *companyLabel;
@property (nonatomic, strong) UIImageView *logoView;

@property (nonatomic, strong) UIImageView *bgView;

@end

@implementation DACompanyOpportunityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
//        [self.contentView addSubview:self.separatorBetweenTitleAndPortrait];
        
        
//        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    }
    return self;
}



- (void)assemble{
    if (self.value) {
//        [self.contentView addSubview:self.companyLabel];
//        [self.contentView addSubview:self.titleLabel];
//        [self.contentView addSubview:self.logoView];
        
        [self.contentView addSubview:self.bgView];
    }
}

- (void)setValue:(id)value{
    [super setValue:value];
//    TLOG(@"value -> %@ self.value -> %@", value, self.value);
    [self assemble];
    [self.companyLabel setText:[NSString stringWithFormat:@"%@", value]];
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR + self.logoH + self.paddingLR;
        CGFloat y = self.companyLabel.frame.origin.y + self.companyLabel.frame.size.height;
        CGFloat w = STYLE_DEVICE_WIDTH -x - self.paddingLR;
        CGFloat h = self.titleH;
        
        _titleLabel  = [[UILabel alloc] init];
        [_titleLabel setFrame:CGRectMake(x, y, w, h)];
        [_titleLabel setNumberOfLines:2];
//                _titleLabel.layer.borderWidth = 1;
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:16]];
        [_titleLabel setTextColor:[UIColor lightGrayColor]];
        [_titleLabel setText:@"Name of the opportunity"];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
//        [_titleLabel resizeWithMaxSize:CGSizeMake(w, h)];
    }
    return _titleLabel;
}

- (UILabel *)companyLabel{
    if (!_companyLabel) {
        CGFloat x = self.paddingLR + self.logoH + self.paddingLR;
        CGFloat y = 20;
        CGFloat w = STYLE_DEVICE_WIDTH -x - self.paddingLR;
        CGFloat h = 24;
        _companyLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_companyLabel setFont:[AGStyleCoordinator fontWithSize:20.0]];
        [_companyLabel setText:@"OG"];
    }
    return _companyLabel;
}

- (UIImageView *)logoView{
    if (!_logoView) {
        CGFloat h = self.logoH;
        CGFloat w = h;
        CGFloat x = self.paddingLR;
        CGFloat y = (self.height - h)/2.0;
        _logoView = [[UIImageView alloc] init];
        [_logoView setFrame:CGRectMake(x, y, w, h)];
        [_logoView setContentMode:UIViewContentModeScaleAspectFit];
        [_logoView setImage:self.logoImage];
        [_logoView.layer setCornerRadius:w/2];
        [_logoView.layer setBorderColor:RGBA(242, 242, 242, 1).CGColor];
        [_logoView.layer setBorderWidth:1];
    }
    return _logoView;
}


- (UIImage *)logoImage{
//    NSInteger idx = self.indexPath.row;
    NSString *logoName = [NSString stringWithFormat:@"Logo%@", self.value];
//    TLOG(@"logoName -> %@", logoName);
    return [UIImage imageNamed:logoName];
}

- (UIImageView *)bgView{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, self.height-10)];
        
//        TLOG(@"self.heigt -> %f",self.height);
        [_bgView setImage:self.bgImage];
//        _bgView.layer.borderWidth = 1;
    }
    return _bgView;
}

- (UIImage *)bgImage{
    return [UIImage imageNamed:self.value];
}

#pragma mark - styles

+ (CGFloat)height{
//    return 100;
    return ((153.0/320.0)*STYLE_DEVICE_WIDTH) + 10;
}

- (void)applySelectedStyle{
    
}

- (CGFloat)paddingLR{
    return 15.0;
}



- (CGFloat)titleH{
    return 40.0;
}


- (UIColor *)borderColor{
    return RGBA(221, 221, 221, 1);
}


- (CGFloat)logoH{
    return 65.0;
}

- (void)applyUnselectedStyle{
    
}

@end
