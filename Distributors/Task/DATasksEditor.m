//
//  DANewOpportunityStepViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATasksEditor.h"
//#import "DAStep.h"
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
//#import "DATaskSection.h"
#import "DATaskEditor.h"
#import "DATextDefine.h"
#import "GlobalDefine.h"
#import "DAOpportunityCoordinator.h"
#import "DATaskDefine.h"
#import "DAOpportunity.h"
#import "RootViewController.h"
#import "DATaskCellStyleEditor.h"
#import "DANewTaskCell.h"
#import "UIImage+DAUtils.h"

typedef NS_ENUM(NSInteger, Section) {
//    SectionName,
    SectionTask,
    SectionAddButton,
    SectionTimeToComplete,
    SectionNotification,
    SectionButton,
    SectionCount
};

@interface DATasksEditor(){
    
}

//@property (nonatomic, strong) DATaskSection *taskSection;
@property (nonatomic, strong) UIBarButtonItem *closeBtnItem;

@end

@implementation DATasksEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        NSString *title = [AGTextCoordinator textForKey:KEY_LBL_GOALS];
        [self setTitle:title];
    }
    return self;
}

- (void)configSections{
    
//    [self taskSection];
    [self.config setCellCls:[DATaskCellStyleEditor class] inSection:SectionTask];
    [self.config setCellCls:[DANewTaskCell class] inSection:SectionAddButton];
    
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_TIME_TO_COMPLETE] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionTimeToComplete]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionTimeToComplete];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_NOTIFY_WHEN_COMPLETE] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionNotification]];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionNotification];
    
    [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
    
    [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    
    [self enableSeparators];
}


#pragma mark - view lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setLeftBarButtonItem:self.closeBtnItem];
}

#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
//    [self.navigationController popViewControllerAnimated:YES];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [[RootViewController singleton] popToOpportunityList];
    }];
    
    
}

- (void)didTapClose:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - setter

- (void)setItem:(DAOpportunity *)item{
    _item = item;
//    [self setTitle:item.name];
    [self configSections];
}

#pragma mark -

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionTask) return self.item.tasks.count;
    if (section == SectionAddButton) return 1;
    if (section == SectionNotification) return 1;
    if (section == SectionButton) return 1;
    if (section == SectionTimeToComplete) return 1;
    return [super numberOfRowsInSection:section];
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == SectionTask) {
        value = [self.item.tasks objectAtIndex:idx];
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
        DATaskType type = idx;
        Class cls = [[DATaskDefine singleton] taskEditorClsForTaskType:type];
        DATaskEditor *vc = [cls instance];
    //                [vc setItem:self.item];
        [vc setItem:[self.item.tasks objectAtIndex:idx]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark - components

- (UIBarButtonItem *)closeBtnItem{
    if (!_closeBtnItem) {
//        UIImage *img = [UIImage imageNamed:@"IconAdd"];
//        img = [img imageRotatedByDegrees:45];
        _closeBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(didTapClose:)];
//        _closeBtnItem = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(didTapClose:)];
    }
    return _closeBtnItem;
}

#pragma mark - 

- (id)cellRequestParameterAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    id value;
    
    if (section == SectionTask || section == SectionAddButton) {
        TLOG(@"self.item -> %@", self.item);
        value = @[self.item];
    }
    
    
    
    return value;
}

@end
