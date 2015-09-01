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
#import "DAButton.h"

@interface DATaskCellStyleTemplateEditor(){
    
}

@property (nonatomic, strong) DAButton *timeRequiredView;

@end

@implementation DATaskCellStyleTemplateEditor

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.progressView setHidden:YES];
        [self.moreStatusContainer setHidden:YES];
        
        [self.contentView addSubview:self.timeRequiredView];
        
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}

#pragma mark - components

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
        _timeRequiredView = [[DAButton alloc] initWithFrame:CGRectMake(x, y, w, h) title:@"48 hrs" iconName:@"IconClock"];
        [_timeRequiredView setAlignLeft:YES];
    }
    return _timeRequiredView;
}

@end
