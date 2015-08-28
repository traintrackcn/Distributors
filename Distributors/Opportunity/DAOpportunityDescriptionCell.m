//
//  DAOpportunityDescriptionCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityDescriptionCell.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"

@interface DAOpportunityDescriptionCell(){
    
}

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation DAOpportunityDescriptionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

#pragma mark - components

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        CGFloat x = self.paddingLR;
        CGFloat y = 0;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        CGFloat h = self.height;
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_contentLabel setNumberOfLines:0];
        [_contentLabel setAdjustsFontSizeToFitWidth:YES];
        [_contentLabel setText:@"Description Description Description Description Description Description Description Description"];
        [_contentLabel setFont:[AGStyleCoordinator fontWithSize:15.0]];
    }
    return _contentLabel;
}

#pragma mark - styles

+ (CGFloat)height{
    return 60.0;
}

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}

@end
