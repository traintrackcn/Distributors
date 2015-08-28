//
//  DADownlineProgressDashboardViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADownlineProgressViewController.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DADownlineProgressCell.h"
#import "DAStyleDefine.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionPeriod,
    SectionItem,
    SectionCount
};

@implementation DADownlineProgressViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"Downlines' Progress"];
        
        [self.config setCellTitle:@"Last" atIndexPath:[NSIndexPath indexPathForItem:0 inSection:SectionPeriod]];
        [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionPeriod];
        [self.config setCellCls:[DADownlineProgressCell class] inSection:SectionItem];
        
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        [self enableSeparators];
        
    }
    return self;
}

#pragma mark - 

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionPeriod) return 1;
    if (section == SectionItem) return 10;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value;
    NSInteger section = indexPath.section;
    
    if (section == SectionPeriod) {
        value = @"WEEK | MONTH | QUARTER";
    }
    
    return value;
}

@end
