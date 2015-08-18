//
//  DACompanyCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACompanyCell.h"
#import "AGStyleCoordinator.h"
#import "DSDeviceUtil.h"
#import "DACompany.h"

@interface DACompanyCell(){
    
}

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DACompanyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        [self.contentView addSubview:self.titleLabel];
    }
}

#pragma mark - setter

- (void)setValue:(id)value{
    [super setValue:value];
    DACompany *item = (DACompany *)value;
    NSString *title;
    if (self.isForCreating) {
        title = @"+NEW";
    }else{
        title = item.name;
    }
    
    [self.titleLabel setText:title];
    
}

#pragma mark - properties

- (BOOL)isForCreating{
    DACompany *item = (DACompany *)self.value;
    if (item.isDummy) return YES;
    return NO;
}

#pragma mark - components

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        CGFloat x = self.paddingLR;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        [_titleLabel setFrame:CGRectMake(x, 0, w, self.height)];
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:16]];
    }
    return _titleLabel;
}

#pragma mark - styles

- (CGFloat)paddingLR{
    return 15.0;
}

@end
