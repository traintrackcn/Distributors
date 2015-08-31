//
//  DAOpportunityTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskSection.h"
#import "AGVCConfiguration.h"
#import "DATaskCell.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
//#import "DANewOpportunityTaskHeaderView.h"
#import "DANewTaskCell.h"
#import "DAOpportunity.h"

@implementation DATaskSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        [self.config setCellCls:[DATaskCell class] inSection:self.section];
    }
    return self;
}

- (void)setItem:(DAOpportunity *)item{
    _item = item;
    [self checkEditMode];
}

- (void)setEditMode:(BOOL)editMode{
    _editMode = editMode;
    [self checkEditMode];
}

- (void)checkEditMode{
    if (self.editMode) {
        [self.config setCellCls:[DANewTaskCell class] atIndexPath:[NSIndexPath indexPathForItem:self.lastIndex inSection:self.section]];
    }else{
        [self.config setCellCls:[DATaskCell class] atIndexPath:[NSIndexPath indexPathForItem:self.lastIndex inSection:self.section]];
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

//- (id)headerValue{
//    return [AGTextCoordinator textForKey:KEY_LBL_TASKS];
//}

@end
