//
//  DATaskDueTimeCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskDueTimeCell.h"

@implementation DATaskDueTimeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        [self.titleLabel setText:@"1 active alert"];
        [self.subtitleLabel setText:@"Due in 5 days"];
    }
    return self;
}

//- (NSString *)iconName{
//    return @"IconBell";
//}

- (CGFloat)titleH{
    return 30;
}

+ (CGFloat)height{
    return 60.0;
}

- (NSString *)iconName{
    return @"IconCalendar";
}

@end
