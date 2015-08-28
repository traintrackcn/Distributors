//
//  DATaskLocationCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskLocationCell.h"
#import "GlobalDefine.h"

@implementation DATaskLocationCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self setBackgroundColor:RGBA(248, 247, 238, 1)];
        [self.subtitleLabel setHidden:YES];
        
        
        CALayer *l = self.titleLabel.layer;
        [l setCornerRadius:self.titleLabel.frame.size.height/2.0];
        [self.titleLabel setClipsToBounds:YES];
        [self.titleLabel setBackgroundColor:RGBA(181, 119, 221, 1)];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return self;
}

- (void)layoutTitleLabel{
    
}

+ (CGFloat)height{
    return 44;
}

- (CGFloat)titleH{
    return 24;
}

- (NSString *)iconName{
    return @"IconLocation";
}

@end
