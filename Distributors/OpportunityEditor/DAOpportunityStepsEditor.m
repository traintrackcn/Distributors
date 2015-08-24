//
//  DANewStepsViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/21/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityStepsEditor.h"
#import "DAOpportunity.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAOpportunityNewStepCell.h"
#import "GlobalDefine.h"
#import "DAOpportunityTaskCell.h"
#import "DAOpportunityStep.h"
#import "DAStyleDefine.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"

@implementation DAOpportunityStepsEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        
    }
    return self;
}

- (void)setItem:(DAOpportunity *)item{
    _item = item;
    [self setTitle:item.name];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    TLOG(@"");
    
    for (NSInteger section = 0; section< 1+self.steps.count; section++) {
        [self.config setCellCls:[DAOpportunityTaskCell class] inSection:section];
    }
    
    [self.config setCellCls:[DAOpportunityNewStepCell class] inSection:self.SectionExtra];
    
    [self.config setCellCls:[AGButtonCell class] inSection:self.SectionButton];
    
    [self enableSeparators];
}

#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
//    [self.defaultNavigationController popViewControllerAnimated:YES];
    [self.defaultNavigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - datasource

- (NSInteger)numberOfSections{
    return self.SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    
    if ([self isStepSection:section]) {
        DAOpportunityStep *item = [self.steps objectAtIndex:section];
        return item.tasks.count;
    }
    
    if (section == self.SectionExtra) {
        if ([self isSectionExtraAvailable]) return 1;
    }
    
    if (section == self.SectionButton) {
        return 1;
    }
    
    return 0;
    
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value = [super valueAtIndexPath:indexPath];
    NSInteger section= indexPath.section;
    
    if(section == self.SectionButton){
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] target:self action:@selector(didTapSave:)]
                  ];
    }
    
    return value;
}

- (id)valueForHeaderOfSection:(NSInteger)section{
    id value = [super valueForHeaderOfSection:section];
    return value;
}


- (BOOL)isSectionExtraAvailable{
    if (self.steps.count > 0) return NO;
    return YES;
}

- (BOOL)isStepSection:(NSInteger)section{
    if (section >= self.SectionFirstStep && section <= self.SectionLastStep) return YES;
    return NO;
}

- (NSInteger)SectionFirstStep{
    return 0;
}

- (NSInteger)SectionLastStep{
    return self.steps.count - 1;
}


- (NSInteger)SectionExtra{
    return self.SectionLastStep + 1;
}

- (NSInteger)SectionButton{
    return self.SectionExtra + 1;
}

- (NSInteger)SectionCount{
    return self.SectionButton + 1;
}


#pragma mark - properties

- (NSArray *)steps{
    return self.item.steps;
}

#pragma mark - 

- (id)cellRequestParameterAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    
    if (section == self.SectionExtra) {
        return @[self.item];
    }
    
    return @[];
}

@end
