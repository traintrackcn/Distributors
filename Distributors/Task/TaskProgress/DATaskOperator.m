//
//  DATaskOperator.m
//  Distributors
//
//  Created by Tao Yunfei on 9/6/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskOperator.h"
#import "DADatePickerCell.h"
#import "AGVCConfiguration.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DACalendarTodoCell.h"


typedef NS_ENUM(NSInteger, Section) {
    SectionDatePicker,
    SectionItem,
    SectionCount
};

@interface DATaskOperator(){
    
}



@end

@implementation DATaskOperator


- (instancetype)init{
    self = [super init];
    if (self) {
        [self.config setCellCls:[DADatePickerCell class] inSection:SectionDatePicker];
        [self.config setCellCls:[DACalendarTodoCell class] inSection:SectionItem];
    }
    return self;
}

#pragma mark - table datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionDatePicker) return 1;
    if (section == SectionItem) return 3;
    return 0;
}


@end
