//
//  DAOpportunityTaskContentSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskDefineSection.h"
#import "AGVCConfiguration.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGTextfieldCell.h"
#import "DAOpportunityCoordinator.h"
#import "DATask.h"
#import "AGTextfieldCell.h"
#import "AGTextCellStyleMore.h"
#import "AGTextCell.h"
#import "DATextDefine.h"
#import "DATaskTypeCell.h"



@implementation DATaskDefineSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        
    }
    return self;
}

- (void)setItem:(DATask *)item{
    _item = item;
    
    NSInteger section = self.section;
    
    [self.config setCellCls:[DATaskTypeCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellType inSection:section]];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_NAME] atIndexPath:[NSIndexPath indexPathForItem:SectionCellName inSection:section]];
    [self.config setCellCls:[AGTextCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellName inSection:section]];
    
    
    [self.config setCellCls:[AGTextfieldCell class] inSection:self.section];
    
}

- (id)valueAtIndex:(NSInteger)index{
    id value;
    
    if (index == SectionCellType) {
        value = self.item;
    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return 0;
}

- (DAOpportunityTaskType)type{
    return self.item.type;
}

@end
