//
//  DAEarningPotentialPicker.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAEarningPotentialPicker.h"
#import "AGTextCoordinator.h"
#import "NSObject+Singleton.h"
#import "DATextDefine.h"
#import "AGViewController+Datasource.h"
#import "DSEarningPotentialPickerCell.h"
#import "DAEarningPotentialDataset.h"
#import "AGViewController+Separator.h"
#import "NSObject+Singleton.h"
#import "DAStyleDefine.h"
#import "AGTextCellStyleMore.h"
#import "DACurrencyDataset.h"
#import "DACurrency.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "DADefine.h"
#import "DAPeriodDataset.h"
#import "DAPeriod.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionPeriod,
    SectionCurrency,
    SectionItem,
    SectionButton,
    SectionCount
};

@interface DAEarningPotentialPicker(){
    
}

@end

@implementation DAEarningPotentialPicker

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_EARNING_POTENTIAL]];
        
        [self.config setCellCls:[AGTextCellStyleMore class] inSection:SectionPeriod];
        [self.config setCellCls:[AGTextCellStyleMore class] inSection:SectionCurrency];
        [self.config setCellCls:[DSEarningPotentialPickerCell class] inSection:SectionItem];
        [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
        [self setBackgroundColor:[AGStyleCoordinator colorBackgroundNormal]];
        [self enableSeparators];
    }
    return self;
}

#pragma mark - table view stuff

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    
    if (section == SectionCurrency){
        return 1;
    }
    
    if (section == SectionItem) {
        return self.items.count;
    }
    
    if (section == SectionButton){
        return 1;
    }
    
    if (section == SectionPeriod){
        return 1;
    }
    
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value;
    
    if (section == SectionPeriod) {
        value = [NSString stringWithFormat:@"Per %@",[DAPeriodDataset singleton].monthItem.name];
    }
    
    if (section == SectionCurrency) {
        value = [DACurrencyDataset singleton].defaultItem.symbol;
    }
    
    if (section == SectionItem) {
        value = [self.items objectAtIndex:idx];
    }
    
    if (section == SectionButton){
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SELECT] target:self action:@selector(didTapSelect:)]
                  ];
    }
    
    return value;
}

#pragma mark - interactive ops

- (void)didTapSelect:(id)sender{
//    [self setValueForAssociatedCell:nowValue];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - properties

- (NSArray *)items{
    return [DAEarningPotentialDataset singleton].items;
}

@end
