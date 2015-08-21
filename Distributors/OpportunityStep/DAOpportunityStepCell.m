//
//  DAOpportunityStepCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityStepCell.h"
#import "DAOpportunity.h"
#import "GlobalDefine.h"
#import "DSDeviceUtil.h"
#import "DAOpportunityStep.h"
#import "DAOpportunityTask.h"
#import "DAStyleDefine.h"
#import "DAOpportunityStepEditor.h"

@interface DAOpportunityStepCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *summaryView;

@end

@implementation DAOpportunityStepCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.summaryView];
        [self assembleGC];
    }
    return self;
}

- (void)didTapCell{
    DAOpportunityStepEditor *vc = [DAOpportunityStepEditor instance];
    [vc setItem:self.value];
    [self pushViewController:vc];
}


#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR;
        CGFloat y = 0;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        CGFloat h = self.titleH;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _titleLabel.layer.borderWidth = 1;
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
        
    }
    return _titleLabel;
}

- (UIView *)summaryView{
    if (!_summaryView) {
        CGFloat x = 0;
        CGFloat y = self.titleH;
        CGFloat w = 0;
        CGFloat h = 0;
        _summaryView = [[UIView alloc] init];
        [_summaryView setFrame:CGRectMake(x, y, w, h)];
    }
    return _summaryView;
}

#pragma mark - setter

- (void)setValue:(id)value{
    [super setValue:value];
    DAOpportunityStep *item = (DAOpportunityStep *)value;
    
    [self.titleLabel setText:[NSString stringWithFormat:@"%ld. %@", ((long)self.indexPath.row + 1), item.name]];
    
    CGFloat x = self.paddingLR;
    CGFloat y = 0;
    CGFloat h = 30.0;
    CGFloat w = [DSDeviceUtil bounds].size.width - self.paddingLR*3;
    for (NSInteger i = 0; i<item.tasks.count; i++) {
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [l setAdjustsFontSizeToFitWidth:YES];
        DAOpportunityTask *task = [item.tasks objectAtIndex:i];
        y += h;
        [self.summaryView addSubview:l];
        [l setText:[NSString stringWithFormat:@"- %@", task.sentence]];
        [l setFont:[AGStyleCoordinator fontWithSize:13.0]];
    }
    
    
    [self setHeight:(self.titleH+y+16)];
    
    [self.contentView addSubview:self.borderBottomViewStyleSolid];
}

#pragma mark - styles

+ (CGFloat)height{
    return 30;
}

- (CGFloat)titleH{
    return 40.0;
}

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}

- (void)applySelectedStyle{
    
}

@end
