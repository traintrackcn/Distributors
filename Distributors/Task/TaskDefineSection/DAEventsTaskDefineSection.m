//
//  DADefineEventsTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAEventsTaskDefineSection.h"
#import "AGTextfieldCell.h"
#import "AGVCConfiguration.h"
#import "AGTextfieldCellStyleOptions.h"

typedef NS_ENUM(NSInteger, AutoshipSectionCell) {
    SectionCellAction=2,
    SectionCellTarget,
    SectionCellCount
};

@implementation DAEventsTaskDefineSection


- (void)setItem:(DATask *)item{
    [super setItem:item];
    
    
    [self.config setCellTitle:@"Action" atIndexPath:[NSIndexPath indexPathForItem:SectionCellAction inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellAction inSection:self.section]];
    
    [self.config setCellTitle:@"Target" atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget inSection:self.section]];
}

- (id)valueAtIndex:(NSInteger)index{
    id value = [super valueAtIndex:index];
    
    if (index == SectionCellName) {
        value = @"Events";
    }
    
    
    if (index == SectionCellAction){
        value = @"Host | Attend";
    }
    
    
    if (index == SectionCellTarget) {
        value = @"XX";
    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return SectionCellCount;
}

@end
