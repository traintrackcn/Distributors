//
//  DADefineAutoshipTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAAutoshipTaskDefineSection.h"
#import "AGTextfieldCell.h"
#import "AGVCConfiguration.h"
#import "AGTextfieldCellStyleOptions.h"

typedef NS_ENUM(NSInteger, AutoshipSectionCell) {
    SectionCellTarget1 = 2,
    SectionCellTarget2,
    SectionCellDate,
    SectionCellCount
};

@implementation DAAutoshipTaskDefineSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        
    }
    return self;
}

- (void)setItem:(DATask *)item{
    [super setItem:item];
    
    [self.config setCellTitle:@"Or Times per month" atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget1 inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget1 inSection:self.section]];
    
    [self.config setCellTitle:@"Or Commission Volume" atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget2 inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget2 inSection:self.section]];
    
    
    [self.config setCellTitle:@"Autoship Date" atIndexPath:[NSIndexPath indexPathForItem:SectionCellDate inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellDate inSection:self.section]];
}

- (id)valueAtIndex:(NSInteger)index{
    id value = [super valueAtIndex:index];
    
    if (index == SectionCellName) {
        value = @"Setup autoship";
    }
    
    if (index == SectionCellDate) {
        value = @"Monday";
    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return SectionCellCount;
}

@end
