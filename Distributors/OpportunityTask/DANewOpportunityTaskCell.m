//
//  AGNewOpportunityTaskCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DANewOpportunityTaskCell.h"
#import "DSDeviceUtil.h"
#import "AGStyleCoordinator.h"
#import "DAStyleDefine.h"
#import "UIActionSheet+Blocks.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "GlobalDefine.h"
#import "DAOpportunityTaskEditor.h"
#import "DAOpportunityStep.h"
#import "DAOpportunityTask.h"
#import "DAOpportunityCoordinator.h"

@interface DANewOpportunityTaskCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DANewOpportunityTaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self assembleGC];
    }
    return self;
}

- (void)didTapCell{
    UIView *v = [self.associatedViewController view];
    
    NSArray *taskTypes = [DAOpportunityCoordinator singleton].taskTexts;
   
    DAOpportunityStep *step = self.parameters.firstObject;
    [UIActionSheet showInView:v withTitle:@"Pick a Goal" cancelButtonTitle:[AGTextCoordinator textForKey:KEY_BTN_CANCEL] destructiveButtonTitle:nil otherButtonTitles:taskTypes tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        
        TLOG(@"buttonIndex -> %ld", (long)buttonIndex);
        
        if (buttonIndex != actionSheet.cancelButtonIndex) {
            DAOpportunityTaskEditor *vc = [DAOpportunityTaskEditor instance];
            DAOpportunityTask *task = [DAOpportunityTask instance];
            [task setType:buttonIndex];
            [vc setStep:step];
            [vc setTask:task];
            [self pushViewController:vc];
        }
        
        
    }];
    
    
//    DAOpportunityTaskEditor *vc = [DAOpportunityTaskEditor instance];
//    DAOpportunityTask *task = [DAOpportunityTask instance];
//    [task setType:0];
//    [vc setStep:self.parameters.firstObject];
//    [vc setTask:task];
//    [self pushViewController:vc];
}

#pragma mark - setter

- (void)setValue:(id)value{
//    self.titleLabel setText:[NSString stringWithFormat:@]
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFrame:CGRectMake(x, 0, w, self.height)];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:80]];
        [_titleLabel setText:@"+ Goal"];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

#pragma mark - styles

+ (CGFloat)height{
    return 80;
}

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}

- (void)applySelectedStyle{
    
}

@end
