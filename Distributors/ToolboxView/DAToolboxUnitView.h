//
//  DAToolboxUnitView.h
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAToolboxItem;
@interface DAToolboxUnitView : UIView

@property (nonatomic, strong) DAToolboxItem *item;

@property (nonatomic, assign) BOOL hightlight;


- (void)addTarget:(id)target action:(SEL)action;

@end
