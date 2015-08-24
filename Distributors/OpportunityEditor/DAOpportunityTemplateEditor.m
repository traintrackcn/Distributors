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
#import "DAOpportunityStep.h"
#import "DAOpportunityTask.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGTextCellStyleTitleOnly.h"
#import "DAOpportunityDataset.h"
#import "NSObject+Singleton.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "DAOpportunityStepCell.h"
#import "DAOpportunityTaskCell.h"
#import "AGStyleCoordinator.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "AGTextfieldCell.h"
#import "DAEarningPotentialSection.h"
#import "DAOpportunityStepSection.h"
#import "AGTextfieldCellStyleOptions.h"


typedef NS_ENUM(NSInteger, Section) {
    SectionSubject,
    SectionStep,
    SectionTimeOffer,
    SectionCommitmentPeriod,
    SectionEarningPotential,
    SectionButton,
    SectionCount
};

@interface DAOpportunityTemplateEditor(){
    
}

//@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) DAEarningPotentialSection *earningPotentialSection;
@property (nonatomic, strong) DAOpportunityStepSection *stepSection;
//@property (nonatomic, strong) NSMutableArray *stepSections;

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
    
    [self.config setCellCls:[AGTextCellStyleTitleOnly class] inSection:SectionSubject];
    
    [self stepSection];
    [self earningPotentialSection];
    
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionTimeOffer];
    [self.config setCellCls:[AGTextfieldCellStyleOptions class] inSection:SectionCommitmentPeriod];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_LIMITED_TIME_OFFER] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionTimeOffer]];
    
    [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_COMMITMENT_PERIOD] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionCommitmentPeriod]];
    
    [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
    [self enableSeparators];
}

#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
    [self.defaultNavigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - components

- (DAEarningPotentialSection *)earningPotentialSection{
    if (!_earningPotentialSection) {
        _earningPotentialSection = [DAEarningPotentialSection instanceWithSection:SectionEarningPotential config:self.config];
        [_earningPotentialSection setItem:self.item];
    }
    return _earningPotentialSection;
}

- (DAOpportunityStepSection *)stepSection{
    if (!_stepSection) {
        _stepSection = [DAOpportunityStepSection instanceWithSection:SectionStep config:self.config];
        [_stepSection setItem:self.item];
    }
    return _stepSection;
}

#pragma mark - table view stuff

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionStep){
        return self.item.steps.count;
    }
    
    return 1;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
//    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if ( section == SectionSubject) {
        value = [NSString stringWithFormat:@"%lu Steps to success with %@", (unsigned long)self.item.steps.count, self.company.name];
    }
    
    if ( section == SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] target:self action:@selector(didTapSave:)]
                  ];
    }
    
    if (section == SectionTimeOffer) {
        value = [AGTextCoordinator textForKey:KEY_LBL_DAYS];
    }
    
    if (section == SectionCommitmentPeriod){
        value = [AGTextCoordinator textForKey:KEY_LBL_MONTHS];
    }
    
    return value;
}

- (id)valueForHeaderOfSection:(NSInteger)section{
    id value = [super valueForHeaderOfSection:section];
    
    if (section == SectionSubject) {
        value = [AGTextCoordinator textForKey:KEY_LBL_SUBJECT];
    }
    
    return value;
}



@end
