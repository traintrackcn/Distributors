//
//  DANewOpportunityStepViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAStepEditor.h"
#import "DAStep.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "AGTextfieldBoxCell.h"
#import "AGTextCell.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAStyleDefine.h"
#import "AGTextCellStyleMore.h"
#import "DATaskSection.h"
#import "DATaskEditor.h"
#import "DATextDefine.h"
#import "GlobalDefine.h"
#import "DAOpportunityCoordinator.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionName,
    SectionTask,
    SectionTimeToComplete,
    SectionNotification,
    SectionButton,
    SectionCount
};

@interface DAStepEditor(){
    
}

@property (nonatomic, strong) DATaskSection *taskSection;

@end

@implementation DAStepEditor

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

- (void)setItem:(DAStep *)item{
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
        @try {
            if (idx != self.taskSection.lastIndex) {
                DAOpportunityTaskType type = idx;
                Class cls = [[DAOpportunityCoordinator singleton] taskEditorClsForTaskType:type];
                DATaskEditor *vc = [cls instance];
                [vc setStep:self.item];
                [vc setItem:[self.item.tasks objectAtIndex:idx]];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
        @catch (NSException *exception) {
            
        }
        
        
        
        
    }
    
}

#pragma mark - components

- (DATaskSection *)taskSection{
    if (!_taskSection) {
        _taskSection = [DATaskSection instanceWithSection:SectionTask config:self.config];
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
