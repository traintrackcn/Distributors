//
//  DATaskCellStyleReadonly.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskCellStyleReadonly.h"
#import "AGLineProgressView.h"
#import "DAStyleDefine.h"
#import "DAButton.h"

@interface DATaskCellStyleReadonly(){
    
}

@property (nonatomic, strong) UILabel *timeRequiredLabel;
@property (nonatomic, strong) DAButton *timeRequiredView;

@end

@implementation DATaskCellStyleReadonly

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.progressView setHidden:YES];
        [self.currentView setHidden:YES];
        [self.targetView setHidden:YES];
        
//        [self.contentView addSubview:self.timeRequiredLabel];
        [self.contentView addSubview:self.timeRequiredView];
        
        [self setAccessoryType:UITableViewCellAccessoryNone];
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


- (DAButton *)timeRequiredView{
    if (!_timeRequiredView) {
//        CGFloat x = self.titleView.frame.origin.x;
//        CGFloat y = self.titleView.frame.origin.y + self.titleView.frame.size.height;
//        CGFloat w = self.titleView.frame.size.width;
//        CGFloat h = 20.0;
        
        CGFloat x = self.titleView.frame.origin.x;
        CGFloat w = self.titleView.frame.size.width;
        CGFloat h = 20;
        CGFloat y = self.titleView.frame.size.height + self.titleView.frame.origin.y + 2;
        _timeRequiredView = [[DAButton alloc] initWithFrame:CGRectMake(x, y, w, h) title:@"3 days" iconName:@"IconClock"];
        [_timeRequiredView setAlignLeft:YES];
    }
    return _timeRequiredView;
}

@end
