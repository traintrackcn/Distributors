//
//  DAOpportunityViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityViewController.h"
#import "RootViewController.h"
#import "NSObject+Singleton.h"
#import "AGTextCell.h"
#import "GlobalDefine.h"
#import "DATaskCellStyleProgress.h"
#import "AGTextCellStyleTitleOnly.h"
#import "DAOpportunityLeaderCell.h"
#import "DAOpportunityDescriptionCell.h"
#import "AGButtonCell.h"
#import "DAStyleDefine.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAOpportunity.h"
#import "AGButtonItem.h"
#import "DATextDefine.h"
#import "UIActionSheet+Blocks.h"
#import "DATaskViewController.h"
#import "DATaskCellStyleReadonly.h"

typedef NS_ENUM(NSInteger, SectionInfoCell) {
    SectionInfoCellTitleWithLeaderInfo,
    SectionInfoCellDescription,
    SectionInfoCellCount
};

@interface DAOpportunityViewController(){
    
}

@end

@implementation DAOpportunityViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)configSections{
    [self.config setCellHeight:0 atFirstIndexPathInSection:self.SectionSeparator];
    [self.config setCellCls:[AGCell class] inSection:self.SectionSeparator];
    
    
    [self.config setCellCls:[DAOpportunityLeaderCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionInfoCellTitleWithLeaderInfo inSection:self.SectionInfo]];
    [self.config setCellCls:[DAOpportunityDescriptionCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionInfoCellDescription inSection:self.SectionInfo]];
    //        [self.config setCellCls:[AGTextCell class] inSection:SectionStep];
    
//    for (NSInteger section = self.SectionFirstStep; section <= self.SectionLastStep; section ++) {
//        [self.config setHeaderCls:[DAStepHeaderView class] forSection:section];
//        [self.config setCellCls:[DATaskCellStyleReadonly class] inSection:section];
//    }
    
    [self.config setCellCls:[DATaskCellStyleReadonly class] inSection:self.SectionTask];
    
    
    [self.config setCellCls:[AGButtonCell class] inSection:self.SectionButton];
    
    [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    [self enableSeparators];
}

- (void)setItem:(DAOpportunity *)item{
    _item = item;
    [self setTitle:item.name];
    [self configSections];
}

#pragma mark - interactive ops

- (void)didTapStart:(id)sender{
//    [[UIDatePicker alloc] initWithFrame:CGRectMake(x, y, w, h)];
    UIView *v = self.view;
    [UIActionSheet showInView:v withTitle:[AGTextCoordinator textForKey:KEY_BTN_START] cancelButtonTitle:[AGTextCoordinator textForKey:KEY_BTN_CANCEL] destructiveButtonTitle:nil otherButtonTitles:@[@"In 1 Day", @"In 2 Days", @"In 3 Days", @"In a Week"] tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        if (buttonIndex != actionSheet.cancelButtonIndex) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

#pragma mark -

- (NSInteger)numberOfSections{
    return self.SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == self.SectionSeparator) return 1;
    if (section == self.SectionInfo) return SectionInfoCellCount;
    if (section == self.SectionButton) return 1;
//    if ([self isStepSection:section]) {
    if (section == self.SectionTask){
//        NSInteger stepIdx = [self stepIndexOfSection:section];
//        DAStep *step = [self.item.steps objectAtIndex:stepIdx];
        return self.item.tasks.count;
    }
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
//    if ([self isStepSection:section]) {
    if (section == self.SectionTask){
//        NSInteger stepIdx = [self stepIndexOfSection:section];
//        DAStep *step = [self.item.steps objectAtIndex:stepIdx];
        return [self.item.tasks objectAtIndex:idx];
    }
    
    if (section == self.SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_START] target:self action:@selector(didTapStart:)]
                  ];
    }
    
    return value;
}

//- (id)valueForHeaderOfSection:(NSInteger)section{
//    
//    id value;
//    
//    if ([self isStepSection:section]) {
//        DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
//        value = @[
//                  [NSString stringWithFormat:@"%ld", ([self stepIndexOfSection:section] + 1)],
//                  [NSString stringWithFormat:@"%@", step.name]
//                  ];
//    }
//    return value;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    NSInteger section = indexPath.section;
//    NSInteger idx = indexPath.row;
//    
//    
//    if ([self isStepSection:section]) {
//        DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
//        DATask *item = [step.tasks objectAtIndex:idx];
//        DATaskViewController *vc = [DATaskViewController instance];
//        [vc setItem:item];
//        [self pushViewController:vc];
//    }
}

//- (NSInteger)isStepSection:(NSInteger)section{
//    if (section >= self.SectionFirstStep && section <= self.SectionLastStep) {
//        return YES;
//    }
//    return NO;
//}

- (NSInteger)SectionSeparator{
    return 0;
}

- (NSInteger)SectionInfo{
    return self.SectionSeparator + 1;
}

- (NSInteger)SectionTask{
    return self.SectionInfo + 1;
}

//- (NSInteger)SectionLastStep{
//    return self.SectionFirstStep + self.item.steps.count - 1;
//}

- (NSInteger)SectionButton{
    return self.SectionTask + 1;
}

- (NSInteger)SectionCount{
    return self.SectionButton + 1;
}

//- (NSInteger)stepIndexOfSection:(NSInteger)section{
//    return section - self.SectionFirstStep;
//}




@end
