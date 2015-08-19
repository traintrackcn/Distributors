//
//  DAOpportunityTemplatePicker.m
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTemplatePicker.h"
#import "DACompany.h"
#import "DAOpportunity.h"
#import "DAOpportunityStep.h"
#import "DAOpportunityTask.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGTextCellStyleTitleOnly.h"
#import "DAOpportunityTemplateCoordinator.h"
#import "NSObject+Singleton.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "DAOpportunityStepCell.h"
#import "DAOpportunityTaskCell.h"
#import "DAEarningPotentialCell.h"
#import "AGStyleCoordinator.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"

@interface DAOpportunityTemplatePicker(){
    
}

//@property (nonatomic, strong) NSArray *items;


@end

@implementation DAOpportunityTemplatePicker

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[AGStyleCoordinator colorBackgroundNormal]];
    }
    return self;
}

- (void)setCompany:(DACompany *)company{
    _company = company;
    [self setTitle:company.name];
}

- (void)setTemplate:(DAOpportunity *)template{
    _template = template;
    
    [self.config setCellCls:[AGTextCellStyleTitleOnly class] inSection:self.SectionSubject];
    for (NSInteger section = 1; section< 1+self.steps.count; section++) {
        [self.config setCellCls:[DAOpportunityTaskCell class] inSection:section];
    }
    [self.config setCellCls:[DAEarningPotentialCell class] inSection:self.SectionEarningPotential];
    [self.config setCellCls:[AGButtonCell class] inSection:self.SectionButton];
    [self enableSeparators];
}

#pragma mark - interactive ops

- (void)didTapSelect:(id)sender{
    
}

#pragma mark - table view stuff

- (NSInteger)numberOfSections{
    return self.SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if ([self isStepSection:section]) {
        NSInteger idx = [self stepIdxOfSection:section];
        DAOpportunityStep *item = [self.steps objectAtIndex:idx];
        return item.tasks.count;
    }
    
    return 1;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value;
    
    if ( section == self.SectionSubject) {
        value = [NSString stringWithFormat:@"Subject of the opportunity (%lu Steps to success with %@)", (unsigned long)self.steps.count, self.company.name];
    }
    
    if ([self isStepSection:section]) {
        NSInteger stepIdx = [self stepIdxOfSection:section];
        DAOpportunityStep *step = [self.steps objectAtIndex:stepIdx];
        value = [step.tasks objectAtIndex:idx];
    }
    
    if (section == self.SectionEarningPotential) {
        value = self.template.earningPotential;
    }
    
    if ( section == self.SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SELECT] target:self action:@selector(didTapSelect:)]
                  ];
    }
    
    
    return value;
}

- (id)valueForHeaderOfSection:(NSInteger)section{
    id value;
    
    if ([self isStepSection:section]) {
        NSInteger idx = [self stepIdxOfSection:section];
        DAOpportunityStep *item = [self.steps objectAtIndex:idx];
        value = [NSString stringWithFormat:@"%ld. %@", (long)idx+1, item.name];
    }
    
    if ( section == self.SectionEarningPotential) {
        value = [AGTextCoordinator textForKey:KEY_LBL_EARNING_POTENTIAL];
    }
    
    return value;
}

- (NSInteger)stepIdxOfSection:(NSInteger)section{
    return section - 1;
}

- (BOOL)isStepSection:(NSInteger)section{
    if (section >= self.SectionFirstStep && section <= self.SectionLastStep) return YES;
    return NO;
}

- (NSInteger)SectionSubject{
    return 0;
}

- (NSInteger)SectionFirstStep{
    return self.SectionSubject + 1;
}

- (NSInteger)SectionLastStep{
    return self.SectionSubject + self.steps.count;
}

- (NSInteger)SectionEarningPotential{
    return self.SectionLastStep + 1;
}

- (NSInteger)SectionButton{
    return self.SectionEarningPotential + 1;
}

- (NSInteger)SectionCount{
    return self.SectionButton + 1;
}

#pragma mark - properties
- (NSArray *)steps{
    if (_template) return _template.steps;
    return nil;
}

@end
