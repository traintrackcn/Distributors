//
//  DATaskNoteCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskNoteCell.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"
#import "GlobalDefine.h"

@interface DATaskNoteCell(){
    
}


@end

@implementation DATaskNoteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:RGBA(248, 247, 238, 1)];
        [self.subtitleLabel setHidden:YES];
        
        
    }
    return self;
}

- (void)layoutIconView{
    [super layoutTitleLabel];
    CGRect frame = self.iconView.frame;
    frame.origin = CGPointMake(frame.origin.x, 13);
    [self.iconView setFrame:frame];
}

+ (CGFloat)height{
    return 75;
}

- (NSString *)iconName{
    return @"IconNote";
}



@end
