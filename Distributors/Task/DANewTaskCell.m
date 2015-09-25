//
//  AGNewOpportunityTaskCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DANewTaskCell.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"
#import "UIActionSheet+Blocks.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "GlobalDefine.h"
#import "DATaskEditor.h"
#import "DAOpportunity.h"
#import "DATask.h"
#import "DAOpportunityCoordinator.h"
#import "DACircleNoteView.h"
#import "DSImage.h"
#import "DATaskTypePicker.h"

@interface DANewTaskCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *addButton;

@end

@implementation DANewTaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.addButton];
        [self.contentView addSubview:self.titleLabel];
        [self assembleGC];
    }
    return self;
}

- (void)didTapCell{
    
    DATaskTypePicker *vc = [DATaskTypePicker instance];
//    vc setModalPresentationStyle:uimo
//    vc setModalTransitionStyle:uimo
    [vc setViewConrollerPresentedFrom:self.associatedViewController];
    [[self.associatedViewController navigationController] presentViewController:vc animated:YES completion:nil];
    
    
}

#pragma mark - setter

- (void)setValue:(id)value{
//    self.titleLabel setText:[NSString stringWithFormat:@]
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR*2 + self.addButton.frame.size.width;
        CGFloat w = STYLE_DEVICE_WIDTH - x*2;
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFrame:CGRectMake(x, 0, w, self.height)];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:18]];
        [_titleLabel setText:[AGTextCoordinator textForKey:KEY_LBL_ADD_GOAL]];
//        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:STYLE_THEME_COLOR_2];
    }
    return _titleLabel;
}

- (UIImageView *)addButton{
    if (!_addButton) {
        CGFloat x = self.paddingLR;
        CGFloat w = 18;
        CGFloat h = w;
        CGFloat y = (self.height - h)/2.0;
        _addButton = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_addButton setImage:self.addButtonImage];
    }
    return _addButton;
}

- (UIImage *)addButtonImage{
    UIImage *img = [UIImage imageNamed:@"ButtonSmallAdd"];
    img = [DSImage image:img withMaskColor:STYLE_THEME_COLOR_2];
    return img;
}

#pragma mark - styles

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}

- (void)applySelectedStyle{
    
}

@end
