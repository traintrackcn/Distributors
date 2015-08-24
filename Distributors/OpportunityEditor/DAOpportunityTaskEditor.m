//
//  DAOpportunityTaskEditor.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTaskEditor.h"
#import "DATextKeyDefine.h"
#import "AGTextCoordinator.h"
#import "AGTextfieldBoxCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAStyleDefine.h"
#import "DAOpportunityTask.h"
#import "DAOpportunityStep.h"
#import "GlobalDefine.h"
#import "DSDeviceUtil.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "DAOpportunityTaskTitleCell.h"
#import "DAOpportunityTaskContentSection.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionTitle,
    SectionContent,
    SectionTimeRequired,
    SectionReminder,
    SectionRepeat,
//    SectionNotification,
    SectionExtraOption,
    SectionButton,
    SectionCount
};

typedef NS_ENUM(NSInteger, SectionExtraOptionCell) {
    SectionExtraOptionCellLocation,
    SectionExtraOptionCellTime,
    SectionExtraOptionCellNotes,
    SectionExtraOptionCellVideoPicture,
    SectionExtraOptionCellLink,
    SectionExtraOptionCellCount
};

@interface DAOpportunityTaskEditor(){
    
}

@property (nonatomic, strong) DAOpportunityTaskContentSection *taskContentSection;

@end

@implementation DAOpportunityTaskEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_TASK_EDITOR]];
        
        
        
    }
    return self;
}

- (void)configSections{
    
    [self.config setCellCls:[DAOpportunityTaskTitleCell class] inSection:SectionTitle];
    
    [self taskContentSection];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_TIME_REQUIRED] atIndexPath:[NSIndexPath indexPathForItem:0 inSection:SectionTimeRequired]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionTimeRequired];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_REMINDER] atIndexPath:[NSIndexPath indexPathForItem:0 inSection:SectionReminder]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionReminder];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_REPEAT] atIndexPath:[NSIndexPath indexPathForItem:0 inSection:SectionRepeat]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionRepeat];
    
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_LOCATION] atIndexPath:[NSIndexPath indexPathForItem:SectionExtraOptionCellLocation inSection:SectionExtraOption]];
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_TIME] atIndexPath:[NSIndexPath indexPathForItem:SectionExtraOptionCellTime inSection:SectionExtraOption]];
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_NOTES] atIndexPath:[NSIndexPath indexPathForItem:SectionExtraOptionCellNotes inSection:SectionExtraOption]];
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_VIDEO_PICTURE] atIndexPath:[NSIndexPath indexPathForItem:SectionExtraOptionCellVideoPicture inSection:SectionExtraOption]];
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_LINK] atIndexPath:[NSIndexPath indexPathForItem:SectionExtraOptionCellLink inSection:SectionExtraOption]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionExtraOption];
    
    [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
    
    [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    [self enableSeparators];
}

- (void)setTask:(DAOpportunityTask *)task{
    _task = task;
    
    [self configSections];
}

#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - components

- (DAOpportunityTaskContentSection *)taskContentSection{
    if (!_taskContentSection) {
        _taskContentSection = [DAOpportunityTaskContentSection instanceWithSection:SectionContent config:self.config];
        [_taskContentSection setItem:self.task];
    }
    return _taskContentSection;
}

#pragma mark - 

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionTitle) return 1;
    if (section == SectionTimeRequired) return 1;
    if (section == SectionReminder) return 1;
    if (section == SectionRepeat) return 1;
//    if (section == SectionNotification) return 1;
    if (section == SectionExtraOption) return SectionExtraOptionCellCount;
    if (section == SectionButton) return 1;
    return [super numberOfRowsInSection:section];
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
//    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == SectionTitle) {
        value = self.task;
    }
    
    if (section == SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] target:self action:@selector(didTapSave:)]
                  ];
    }
    
    return value;
}

@end
