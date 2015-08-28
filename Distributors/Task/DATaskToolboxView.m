//
//  DATaskToolboxView.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskToolboxView.h"
#import "DAToolboxUnitView.h"
#import "DAToolboxItem.h"
#import "DAStyleDefine.h"
#import "DATextDefine.h"

@interface DATaskToolboxView(){
    NSArray *titles;
    NSArray *icons;
}

@property (nonatomic, strong) DAToolboxItem *locationUnit;
@property (nonatomic, strong) DAToolboxItem *dueTimeUnit;
@property (nonatomic, strong) DAToolboxItem *notesUnit;
@property (nonatomic, strong) DAToolboxItem *pictureAndVideoUnit;
@property (nonatomic, strong) DAToolboxItem *linksUnit;

//@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation DATaskToolboxView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self assemble];
    }
    return self;
}

#pragma mark - components

- (void)assemble{
    titles = @[
               [AGTextCoordinator textForKey:KEY_LBL_LOCATION],
               [AGTextCoordinator textForKey:KEY_LBL_TIME],
               [AGTextCoordinator textForKey:KEY_LBL_NOTES],
               [AGTextCoordinator textForKey:KEY_LBL_PIC_AND_VCR],
               [AGTextCoordinator textForKey:KEY_LBL_LINKS],
               ];
    
    icons = @[
              @"IconLocation",
              @"IconDueTime",
              @"IconNote",
              @"IconPicAndVcr",
              @"IconLink"
              ];
    
    
    NSInteger num = titles.count;
    CGFloat x = 0;
    CGFloat w = [DSDeviceUtil bounds].size.width/num;
    CGFloat h = self.frame.size.height;
    
    for (NSInteger i = 0; i<num; i++) {
        DAToolboxUnitView *v = [[DAToolboxUnitView alloc] initWithFrame:CGRectMake(x, 0, w, h)];
        DAToolboxItem *item = [DAToolboxItem instance];
        [item setTitle:[titles objectAtIndex:i]];
        [item setIconName:[icons objectAtIndex:i]];
        [item setNormalColor:self.normalColor];
        [item setHighlightColor:self.highlightColor];
        [v setItem:item];
        [self addSubview:v];
        x+= w;
        
//        v.layer.borderWidth = 1;
    }
}

- (DAToolboxUnitView *)unitViewAtIndex:(NSInteger)index{
    return [self.subviews objectAtIndex:index];
}

#pragma mark - styles

- (UIColor *)normalColor{
    return STYLE_THEME_COLOR;
}

- (UIColor *)highlightColor{
    return STYLE_THEME_COLOR_2;
}

@end
