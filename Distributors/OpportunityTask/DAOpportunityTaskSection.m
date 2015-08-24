//
//  DAOpportunityTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTaskSection.h"
#import "AGVCConfiguration.h"
#import "DAOpportunityTaskCell.h"
#import "DAOpportunityStep.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
//#import "DANewOpportunityTaskHeaderView.h"
#import "DANewOpportunityTaskCell.h"

@implementation DAOpportunityTaskSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        [self.config setCellCls:[DAOpportunityTaskCell class] inSection:self.section];
    }
    return self;
}

- (void)setItem:(DAOpportunityStep *)item{
    _item = item;
    [self checkEditMode];
}

- (void)setEditMode:(BOOL)editMode{
    _editMode = editMode;
    [self checkEditMode];
}

- (void)checkEditMode{
    if (self.editMode) {
        [self.config setCellCls:[DANewOpportunityTaskCell class] atIndexPath:[NSIndexPath indexPathForItem:self.lastIndex inSection:self.section]];
    }else{
        [self.config setCellCls:[DAOpportunityTaskCell class] atIndexPath:[NSIndexPath indexPathForItem:self.lastIndex inSection:self.section]];
    }
}

- (id)valueAtIndex:(NSInteger)index{
    if (self.editMode) {
        if (index == self.lastIndex) {
            return nil;
        }
    }
    return [self.item.tasks objectAtIndex:index];
}

- (NSInteger)numberOfRows{
    NSInteger num = self.item.tasks.count;
    if (self.editMode) num ++;
    return num;
}

- (NSInteger)lastIndex{
    return self.numberOfRows - 1;
}

- (id)headerValue{
    return [AGTextCoordinator textForKey:KEY_LBL_TASKS];
}

@end
