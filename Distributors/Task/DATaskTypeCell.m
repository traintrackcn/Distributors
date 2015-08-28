//
//  DAOpportunityTaskTitleCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskTypeCell.h"
#import "DSDeviceUtil.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "DAStyleDefine.h"
#import "DATask.h"
#import "DAOpportunityCoordinator.h"
#import "DSImage.h"

@interface DATaskTypeCell(){
    
}

@property (nonatomic, strong) UIImageView *typeIconView;

@end

@implementation DATaskTypeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [self.contentView addSubview:self.sentenceLabel];
    }
    return self;
}


#pragma mark - setter

- (void)setValue:(id)value{
    [super setValue:value];
    
    
//    [self.typeLabel setText:item.textOfType];
    [self.contentView addSubview:self.typeIconView];
}

#pragma mark - components

- (UIImageView *)typeIconView{
    if (!_typeIconView) {
        CGFloat h = self.labelH;
        CGFloat w = h;
        CGFloat x = ([DSDeviceUtil bounds].size.width - w)/2.0;
        CGFloat y = (self.height - h)/2.0;
        _typeIconView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        _typeIconView.layer.borderWidth = 1;
        [_typeIconView setImage:self.typeIconImage];
    }
    return _typeIconView;
}

- (UIImage *)typeIconImage{
    DATask *item = (DATask *)self.value;
    UIImage *img = [[DAOpportunityCoordinator singleton] taskIconImageForTaskType:item.type];
    img = [DSImage image:img withMaskColor:STYLE_THEME_COLOR_2];
    return img;
}

#pragma mark - styles

+ (CGFloat)height{
    return 90;
}

- (CGFloat)labelH{
    return 72.0;
}

@end
