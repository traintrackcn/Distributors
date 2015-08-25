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
@property (nonatomic, strong) UILabel *rateLabel;

@end

@implementation DAOpportunityLeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.portraitView];
        [self.contentView addSubview:self.creatorNameLabel];
        [self.contentView addSubview:self.rateLabel];
        [self.contentView addSubview:self.borderBottomViewStylePaddingLR];
        [self assembleGC];
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
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
        CGFloat x = self.paddingLR;
        
        CGFloat h = self.contentH;
        CGFloat w = h;
        CGFloat y = (self.height - h)/2.0;
        _portraitView = [[AGPortraitView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_portraitView.imageView setImage:[UIImage imageNamed:@"nopic_mini.jpg"]];
    }
    
    return _portraitView;
}


- (UILabel *)creatorNameLabel{
    if (!_creatorNameLabel) {
        CGFloat x = self.portraitView.frame.size.width + self.portraitView.frame.origin.x + self.paddingLR;
        CGFloat y = self.portraitView.frame.origin.y;
        CGFloat w = [DSDeviceUtil bounds].size.width - x - self.paddingLR;
        CGFloat h = self.labelH;
        _creatorNameLabel = [[UILabel alloc] init];
        [_creatorNameLabel setAdjustsFontSizeToFitWidth:YES];
        [_creatorNameLabel setFrame:CGRectMake(x, y, w, h)];
//        [_creatorNameLabel setTextAlignment:NSTextAlignmentCenter];
        //        _creatorNameLabel.layer.borderWidth = 1;
        [_creatorNameLabel setText:@"Creator"];
    }
    return _creatorNameLabel;
}


- (UILabel *)rateLabel{
    if (!_rateLabel) {
        CGFloat y = self.labelH;
        CGFloat h = 15;
        CGFloat x = self.creatorNameLabel.frame.origin.x;
        CGFloat w = self.creatorNameLabel.frame.size.width;
        
        _rateLabel = [[UILabel alloc] init];
        [_rateLabel setFrame:CGRectMake(x, y, w, h)];
        //        _rateLabel.layer.borderWidth = 1;
        [_rateLabel setAdjustsFontSizeToFitWidth:YES];
        [_rateLabel setText:@"★★★★☆"];
    }
    return _rateLabel;
}

#pragma mark - styles

+ (CGFloat)height{
    return 60;
}

- (CGFloat)labelH{
    return 40;
}

- (CGFloat)contentH{
    return 48.0;
}

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}


@end
