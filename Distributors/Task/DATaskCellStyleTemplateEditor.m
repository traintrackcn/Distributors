//
//  DATaskCellStyleTemplateEditor.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskCellStyleTemplateEditor.h"
#import "AGLineProgressView.h"
#import "DAStyleDefine.h"

@interface DATaskCellStyleTemplateEditor(){
    
}

@property (nonatomic, strong) UILabel *timeRequiredLabel;

@end

@implementation DATaskCellStyleTemplateEditor

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.progressView setHidden:YES];
        [self.currentView setHidden:YES];
        [self.targetView setHidden:YES];
        
        [self.contentView addSubview:self.timeRequiredLabel];
        
        
    }
    return self;
}

#pragma mark - components

- (UILabel *)timeRequiredLabel{
    if (!_timeRequiredLabel) {
        CGFloat x = self.titleView.frame.origin.x;
        CGFloat w = self.titleView.frame.size.width;
        CGFloat h = 20;
        CGFloat y = self.titleView.frame.size.height + self.titleView.frame.origin.y;
        _timeRequiredLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_timeRequiredLabel setFont:[AGStyleCoordinator fontWithSize:11]];
        [_timeRequiredLabel setText:@"Time Required:  3 days"];
        [_timeRequiredLabel setTextColor:STYLE_TEXT_COLOR_SUBTITLE];
    }
    return _timeRequiredLabel;
}

@end
