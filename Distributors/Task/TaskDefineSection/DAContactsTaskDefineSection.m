//
//  DADefineContactsTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAContactsTaskDefineSection.h"
#import "AGTextfieldCell.h"
#import "AGVCConfiguration.h"

typedef NS_ENUM(NSInteger, AutoshipSectionCell) {
    SectionCellTarget = 2,
    SectionCellCount
};

@implementation DAContactsTaskDefineSection

- (void)setItem:(DATask *)item{
    [super setItem:item];
    
    [self.config setCellTitle:@"Target" atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellTarget inSection:self.section]];
}

- (id)valueAtIndex:(NSInteger)index{
    id value = [super valueAtIndex:index];
    
    if (index == SectionCellName) {
        value = @"Create/approach/enroll contacts";
    }
    
    if (index == SectionCellTarget) {
        value = @"20";
    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return SectionCellCount;
}


@end
