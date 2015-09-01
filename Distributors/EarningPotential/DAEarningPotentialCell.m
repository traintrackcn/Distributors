//
//  DAEaringPotentialCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAEarningPotentialCell.h"
#import "DSDeviceUtil.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "DAEarningPotential.h"
#import "DAEarningPotentialPicker.h"
#import "GlobalDefine.h"
#import "DAStyleDefine.h"
#import "DAPeriod.h"

@interface DAEarningPotentialCell(){
    
}

//@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DAEarningPotentialCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//        [self.contentView addSubview:self.titleLabel];
        [self assembleGC];
    }
    return self;
}

//- (void)willMoveToSuperview:(UIView *)newSuperview{
//    if (newSuperview && self.isContentViewBlank) {
//        
//        
//    }
//}

- (void)didTapCell{
    DAEarningPotentialPicker *vc = [DAEarningPotentialPicker instance];
    [vc setAssociatedCell:self];
    [self pushViewController:vc];
    
//    TLOG(@"naviC -> %@", [(AGViewController *)self.associatedViewController parentViewController]);
}

#pragma mark - setters

- (void)setValue:(id)value{
    [super setValue:value];
    DAEarningPotential *item = (DAEarningPotential *)value;
    
    if (item) {
        NSString *text = [NSString stringWithFormat:@"$%.2f~$%.2f/%@", item.min, item.max, item.period.name];
        [contentLabel setText:text];
    }
}

#pragma mark - components

//- (UILabel *)titleLabel{
//    if (!_titleLabel) {
//        CGFloat x = self.paddingLR;
//        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
//        _titleLabel = [[UILabel alloc] init];
//        [_titleLabel setFrame:CGRectMake(x, 0, w, self.height)];
//        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
//        [_titleLabel setText:[AGTextCoordinator textForKey:KEY_LBL_EARNING_POTENTIAL]];
//    }
//    return _titleLabel;
//}

#pragma mark - styles

//- (CGFloat)paddingLR{
//    return STYLE_PADDING_LR_DEFAULT;
//}

- (UIColor *)borderColor{
    return STYLE_BORDER_COLOR_DEFAULT;
}

@end
