//
//  DATaskViewController.h
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGViewController.h"

@class DATask;

@interface DATaskViewController : AGViewController


- (BOOL)isSectionReportAvailable;
- (BOOL)isSectionButtonAvailable;
- (BOOL)isLogBookAvailable;
- (BOOL)isEditorAvailable;

@property (nonatomic, weak) DATask *item;

@end
