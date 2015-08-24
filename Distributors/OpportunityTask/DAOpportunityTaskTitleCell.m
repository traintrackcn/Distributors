//
//  DAOpportunityTaskTitleCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTaskTitleCell.h"
#import "DSDeviceUtil.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "AGStyleCoordinator.h"
#import "DAOpportunityTask.h"

@interface DAOpportunityTaskTitleCell(){
    
}

@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *sentenceLabel;

@end

@implementation DAOpportunityTaskTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.sentenceLabel];
    }
    return self;
}


#pragma mark - setter

- (void)setValue:(id)value{
    [super setValue:value];
    
    DAOpportunityTask *item = (DAOpportunityTask *)value;
    [self.typeLabel setText:item.textOfType];
}

#pragma mark - components

- (UILabel *)typeLabel{
    if (!_typeLabel) {
        CGFloat x = self.paddingLR;
        CGFloat h = self.labelH;
        CGFloat w = h;
        CGFloat y = (self.height - h)/2.0;
        
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        _typeLabel.layer.borderWidth = 1;
        [_typeLabel setTextAlignment:NSTextAlignmentCenter];
        [_typeLabel setFont:[AGStyleCoordinator fontWithSize:14.0]];
        [_typeLabel.layer setCornerRadius:h/2.0];
    }
    return _typeLabel;
}

- (UILabel *)sentenceLabel{
    if (!_sentenceLabel) {
        CGFloat x = self.typeLabel.frame.size.width + self.paddingLR + self.paddingLR;
        CGFloat h = self.labelH;
        CGFloat y = (self.height - h)/2.0;
        CGFloat w = [DSDeviceUtil bounds].size.width - x - self.paddingLR;
        _sentenceLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        _sentenceLabel.layer.borderWidth = 1;
    }
    return _sentenceLabel;
}

#pragma mark - styles

+ (CGFloat)height{
    return 80;
}

- (CGFloat)labelH{
    return 72.0;
}

@end
