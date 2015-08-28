//
//  DATaskReminderCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskReminderCell.h"

@implementation DATaskReminderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self.titleLabel setText:@"1 active alert"];
        [self.subtitleLabel setText:@"Next alert on: Mon 31 Aug, 04:30 PM"];
    }
    return self;
}

- (NSString *)iconName{
    return @"IconBell";
}

- (CGFloat)titleH{
    return 30;
}

+ (CGFloat)height{
    return 60.0;
}

@end
