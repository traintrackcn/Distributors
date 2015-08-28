//
//  DADefineTrainingTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATrainingTaskDefineSection.h"
#import "AGVCConfiguration.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGTextfieldCell.h"
//#import "AGTextCellStyleMore.h"

typedef NS_ENUM(NSInteger, AutoshipSectionCell) {
    SectionCellTarget=2,
    SectionCellWeb,
    SectionCellDocuments,
    SectionCellCount
};

@implementation DATrainingTaskDefineSection

- (void)setItem:(DATask *)item{
    [super setItem:item];
    
    
    [self.config setCellTitle:@"Target" atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget inSection:self.section]];
    
    [self.config setCellTitle:@"Web" atIndexPath:[NSIndexPath indexPathForItem:SectionCellWeb inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellWeb inSection:self.section]];
    
    [self.config setCellTitle:@"Documents" atIndexPath:[NSIndexPath indexPathForItem:SectionCellDocuments inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellDocuments inSection:self.section]];
    
}

- (id)valueAtIndex:(NSInteger)index{
    id value = [super valueAtIndex:index];
    
    if (index == SectionCellName) {
        value = @"Training";
    }
    
    if (index == SectionCellTarget) {
        value = @"XX calls";
    }
    
    if (index == SectionCellWeb) {
        value = @"https://www.abc.com";
    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return SectionCellCount;
}


@end
