//
//  DAOpportunityNewStepCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityNewStepCell.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "DAOpportunityStepEditor.h"
#import "DAOpportunityStep.h"

@interface DAOpportunityNewStepCell(){
    
}

@property (nonatomic, strong) UILabel *buttonView;

@end

@implementation DAOpportunityNewStepCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self assembleGC];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview && self.isContentViewBlank) {
        [self.contentView addSubview:self.buttonView];
    }
}

#pragma mark - interactive ops

- (void)didTapCell{
    DAOpportunityStepEditor *vc = [DAOpportunityStepEditor instance];
    [vc setItem:[DAOpportunityStep instance]];
    [self pushViewController:vc];
}

#pragma mark - components

- (UILabel *)buttonView{
    if (!_buttonView) {
        CGFloat w = 200;
        CGFloat h = 200;
        CGFloat x = ([DSDeviceUtil bounds].size.width - w)/2.0;
        CGFloat y = (self.height - h)/2.0;
        _buttonView  = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_buttonView setText:[AGTextCoordinator textForKey:KEY_BTN_ADD_YOUR_FIRST_STEP]];
        [_buttonView setTextAlignment:NSTextAlignmentCenter];
        [_buttonView setNumberOfLines:2];
        [_buttonView setAdjustsFontSizeToFitWidth:YES];
        [_buttonView setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _buttonView;
}

#pragma mark - style

+ (CGFloat)height{
    return [DSDeviceUtil bounds].size.height - STYLE_NAVIGATION_BAR_HEIGHT - STYLE_STATUS_BAR_HEIGHT;
}

- (void)applySelectedStyle{
    
}

@end
