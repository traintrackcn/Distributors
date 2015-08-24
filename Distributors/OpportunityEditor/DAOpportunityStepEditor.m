//
//  DANewOpportunityStepViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityStepEditor.h"
#import "DAOpportunityStep.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "AGTextfieldBoxCell.h"
#import "AGTextCell.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAStyleDefine.h"
#import "AGTextCellStyleMore.h"
#import "DAOpportunityTaskSection.h"
#import "DAOpportunityTaskEditor.h"
#import "DATextKeyDefine.h"
#import "GlobalDefine.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionName,
    SectionTask,
    SectionTimeToComplete,
    SectionNotification,
    SectionButton,
    SectionCount
};

@interface DAOpportunityStepEditor(){
    
}

@property (nonatomic, strong) DAOpportunityTaskSection *taskSection;

@end

@implementation DAOpportunityStepEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_STEP_EDITOR]];
    }
    return self;
}

- (void)configSections{
    NSString *title = [NSString stringWithFormat:@"%@", [AGTextCoordinator textForKey:KEY_LBL_STEP_NAME]];
    
    [self.config setCellTitle:title atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionName]];
    [self.config setCellCls:[AGTextfieldBoxCell class] inSection:SectionName];
    
    [self taskSection];
    
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_TIME_TO_COMPLETE] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionTimeToComplete]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionTimeToComplete];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_NOTIFY_WHEN_COMPLETE] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionNotification]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionNotification];
    
    [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
    
    [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    
    [self enableSeparators];
}

#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - setter

- (void)setItem:(DAOpportunityStep *)item{
    _item = item;
//    [self setTitle:item.name];
    [self configSections];
}

#pragma mark -

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionName) return 1;
    if (section == SectionNotification) return 1;
    if (section == SectionButton) return 1;
    if (section == SectionTimeToComplete) return 1;
    return [super numberOfRowsInSection:section];
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == SectionName){
        value = @"Become a Product of the Product";
    }
    
    if (section == SectionTimeToComplete) {
        value = @"21Days";
    }
    
    if (section == SectionNotification) {
        value = @"YES";
    }
    
    if (section == SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] target:self action:@selector(didTapSave:)]
                  ];
    }
    
    return value;
}

- (id)valueForHeaderOfSection:(NSInteger)section{
    id value = [super valueForHeaderOfSection:section];
    
//    if (section == SectionTimeToComplete) {
//        value = [AGTextCoordinator textForKey:KEY_LBL_TIME_TO_COMPLETE];
//    }
    
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    if (section == SectionTask) {
        
        if (idx != self.taskSection.lastIndex) {
            DAOpportunityTaskEditor *vc = [DAOpportunityTaskEditor instance];
            [vc setStep:self.item];
            [vc setTask:[self.item.tasks objectAtIndex:idx]];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }
    
}

#pragma mark - components

- (DAOpportunityTaskSection *)taskSection{
    if (!_taskSection) {
        _taskSection = [DAOpportunityTaskSection instanceWithSection:SectionTask config:self.config];
        [_taskSection setItem:self.item];
        [_taskSection setEditMode:YES];
    }
    return _taskSection;
}

#pragma mark - 

- (id)cellRequestParameterAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    id value;
    
    if (section == SectionTask) {
        TLOG(@"self.item -> %@", self.item);
        value = @[self.item];
    }
    
    return value;
}

@end
