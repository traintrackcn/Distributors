//
//  DAOpportunityTemplatePicker.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTemplateEditor.h"
#import "DACompany.h"
#import "DAOpportunity.h"
#import "DAStep.h"
#import "DATask.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGTextCellStyleTitleOnly.h"
#import "DAOpportunityDataset.h"
#import "NSObject+Singleton.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "DAStepCell.h"
#import "DATaskCell.h"
#import "DAStyleDefine.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"
#import "AGTextfieldCell.h"
#import "DAEarningPotentialSection.h"
#import "AGTextfieldCellStyleOptions.h"
#import "DAOpportunityTitleCell.h"
#import "DATaskCellStyleTemplateEditor.h"
#import "DAStepHeaderView.h"
#import "DATaskEditor.h"

@interface DAOpportunityTemplateEditor(){
    
}

//@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) DAEarningPotentialSection *earningPotentialSection;

@end

@implementation DAOpportunityTemplateEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[AGStyleCoordinator colorBackgroundNormal]];
    }
    return self;
}

- (void)setCompany:(DACompany *)company{
    _company = company;
    NSString *text = [NSString stringWithFormat:@"%@ %@", _company.name, [AGTextCoordinator textForKey:KEY_LBL_TEMPLATE]];
    [self setTitle:text];
}

- (void)setItem:(DAOpportunity *)item{
    _item = item;
    
    [self.config setCellCls:[DAOpportunityTitleCell class] inSection:self.SectionTitle];
    
    
    for (NSInteger section = self.SectionFirstStep; section <= self.SectionLastStep; section ++) {
        [self.config setHeaderCls:[DAStepHeaderView class] forSection:section];
        [self.config setCellCls:[DATaskCellStyleTemplateEditor class] inSection:section];
    }
    
    [self earningPotentialSection];
    
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:self.SectionTimeOffer];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:self.SectionCommitmentPeriod];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_LIMITED_TIME_OFFER] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.SectionTimeOffer]];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_COMMITMENT_PERIOD] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.SectionCommitmentPeriod]];
    
    [self.config setCellCls:[AGButtonCell class] inSection:self.SectionButton];
    [self enableSeparators];
}

#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
    [self.defaultNavigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - components

- (DAEarningPotentialSection *)earningPotentialSection{
    if (!_earningPotentialSection) {
        _earningPotentialSection = [DAEarningPotentialSection instanceWithSection:self.SectionEarningPotential config:self.config];
        [_earningPotentialSection setItem:self.item];
    }
    return _earningPotentialSection;
}

#pragma mark - table view stuff

- (NSInteger)numberOfSections{
    return self.SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == self.SectionButton) return 1;
    if ([self isStepSection:section]) {
        NSInteger stepIdx = [self stepIndexOfSection:section];
        DAStep *step = [self.item.steps objectAtIndex:stepIdx];
        return step.tasks.count;
    }
    return 1;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if ([self isStepSection:section]) {
        NSInteger stepIdx = [self stepIndexOfSection:section];
        DAStep *step = [self.item.steps objectAtIndex:stepIdx];
        return [step.tasks objectAtIndex:idx];
    }
    
    if ( section == self.SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] target:self action:@selector(didTapSave:)]
                  ];
    }
    
    if (section == self.SectionTimeOffer) {
        value = [AGTextCoordinator textForKey:KEY_LBL_DAYS];
    }
    
    if (section == self.SectionCommitmentPeriod){
        value = [AGTextCoordinator textForKey:KEY_LBL_MONTHS];
    }
    
    return value;
}


- (id)valueForHeaderOfSection:(NSInteger)section{
    
    id value;
    
    if ([self isStepSection:section]) {
        DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
        value = @[
                  [NSString stringWithFormat:@"%ld", ([self stepIndexOfSection:section] + 1)],
                  [NSString stringWithFormat:@"%@", step.name]
                  ];
    }
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    
    if ([self isStepSection:section]) {
        DAStep *step = [self.item.steps objectAtIndex:[self stepIndexOfSection:section]];
        DATask *item = [step.tasks objectAtIndex:idx];
        DATaskEditor *vc = [DATaskEditor instance];
        [vc setItem:item];
        [self pushViewController:vc];
    }
}

- (NSInteger)isStepSection:(NSInteger)section{
    if (section >= self.SectionFirstStep && section <= self.SectionLastStep) {
        return YES;
    }
    return NO;
}

- (NSInteger)SectionTitle{
    return 0;
}

- (NSInteger)SectionFirstStep{
    return self.SectionTitle + 1;
}

- (NSInteger)SectionLastStep{
    return self.SectionFirstStep + self.item.steps.count - 1;
}

- (NSInteger)SectionTimeOffer{
    return self.SectionLastStep + 1;
}

- (NSInteger)SectionCommitmentPeriod{
    return self.SectionTimeOffer + 1;
}

- (NSInteger)SectionEarningPotential{
    return self.SectionCommitmentPeriod + 1;
}


- (NSInteger)SectionButton{
    return self.SectionEarningPotential + 1;
}

- (NSInteger)SectionCount{
    return self.SectionButton + 1;
}

- (NSInteger)stepIndexOfSection:(NSInteger)section{
    return section - self.SectionFirstStep;
}




@end