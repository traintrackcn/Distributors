//
//  DAStepTitleCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTitleCell.h"
#import "DAStyleDefine.h"
#import "UILabel+AGUtil.h"

@interface DAOpportunityTitleCell(){
    
}



@end

@implementation DAOpportunityTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.bgView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}


#pragma mark - components


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR;
        CGFloat y = self.paddingTB;
        CGFloat w = STYLE_DEVICE_WIDTH - x*2;
        CGFloat h = self.titleH;
        
        _titleLabel  = [[UILabel alloc] init];
        [_titleLabel setFrame:CGRectMake(x, y, w, h)];
        [_titleLabel setNumberOfLines:2];
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:18.0]];
        //        _titleLabel.layer.borderWidth = 1;
        
        [_titleLabel setText:@"5 steps to become a top stylist with Stella"];
        
        [_titleLabel resizeWithMaxSize:CGSizeMake(w, h)];
    }
    return _titleLabel;
}

- (UIView *)bgView{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, 100)];
    [imgV setContentMode:UIViewContentModeScaleAspectFill];
    [imgV setImage:[UIImage imageNamed:@"CellBackground1"]];
    [imgV setClipsToBounds:YES];
    return imgV;
}

#pragma mark - 

+ (CGFloat)height{
    return 100.0;
}

- (CGFloat)paddingLR{
    return 15.0;
}

- (CGFloat)paddingTB{
    return 15.0;
}

- (CGFloat)titleH{
    return 60;
}

@end
