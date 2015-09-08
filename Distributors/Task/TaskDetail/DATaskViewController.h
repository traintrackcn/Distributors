//
//  DATaskViewController.h
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGViewController.h"

@class DATask;
@class DAOpportunity;

@interface DATaskViewController : AGViewController

- (BOOL)isSectionDefineAvailable;
- (BOOL)isSectionTimeRequiredAvailable;
- (BOOL)isSectionRepeatAvailable;
- (BOOL)isSectionNotificationAvailable;

- (BOOL)isSectionReportAvailable;
- (BOOL)isSectionButtonAvailable;
- (BOOL)isLogBookAvailable;
- (BOOL)isEditorAvailable;


- (void)didTapSave:(id)sender;

@property (nonatomic, weak) DATask *item;
@property (nonatomic, weak) DAOpportunity *opportunity;

@end
