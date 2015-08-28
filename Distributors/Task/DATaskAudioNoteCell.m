//
//  DATaskAudioNoteCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskAudioNoteCell.h"

@implementation DATaskAudioNoteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        [self setBackgroundColor:RGBA(248, 247, 238, 1)];
        [self.subtitleLabel setHidden:YES];
    }
    return self;
}

+ (CGFloat)height{
    return 44;
}

- (CGFloat)titleH{
    return 32;
}

- (NSString *)iconName{
    return @"IconSpeaker";
}

@end
