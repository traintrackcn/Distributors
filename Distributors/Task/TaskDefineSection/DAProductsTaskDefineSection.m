//
//  DADefineProductsTaskSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAProductsTaskDefineSection.h"
#import "AGVCConfiguration.h"
#import "AGTextfieldCell.h"


typedef NS_ENUM(NSInteger, AutoshipSectionCell) {
    SectionCellProduct=2,
    SectionCellCount
};

@implementation DAProductsTaskDefineSection

- (void)setItem:(DATask *)item{
    [super setItem:item];
    
    
    [self.config setCellTitle:@"Product" atIndexPath:[NSIndexPath indexPathForItem:SectionCellProduct inSection:self.section]];
    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellProduct inSection:self.section]];
    
//    [self.config setCellTitle:@"Product2" atIndexPath:[NSIndexPath indexPathForItem:SectionCellProduct2 inSection:self.section]];
//    [self.config setCellCls:[AGTextfieldCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionCellProduct2 inSection:self.section]];
}

- (id)valueAtIndex:(NSInteger)index{
    id value = [super valueAtIndex:index];
    
    if (index == SectionCellName) {
        value = @"Buy/sell products";
    }
    
    if (index == SectionCellProduct) {
        value = @"6";
    }
    
//    if (index == SectionCellProduct2) {
//        value = @"3";
//    }
    
    return value;
}

- (NSInteger)numberOfRows{
    return SectionCellCount;
}


@end
