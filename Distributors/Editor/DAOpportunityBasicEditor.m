//
//  DANewOpportunityTemplateViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/20/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityBasicEditor.h"
#import "DATextDefine.h"
#import "AGTextCoordinator.h"
#import "DAEarningPotentialSection.h"
#import "DAOpportunityDataset.h"
#import "DAOpportunityCoordinator.h"
#import "AGTextfieldCell.h"
#import "AGTextfieldBoxCell.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAStyleDefine.h"
#import "DAOpportunity.h"
#import "DACompany.h"
#import "GlobalDefine.h"
#import "DATasksEditor.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSubject,
    SectionDescription,
    SectionCompany,
    SectionEarningPotential,
    SectionButton,
    SectionCount
};

@interface DAOpportunityBasicEditor(){
    
}

@property (nonatomic, strong) DAEarningPotentialSection *earningPotentialSection;

@property (nonatomic, strong) UIBarButtonItem *closeBtnItem;

@end

@implementation DAOpportunityBasicEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [[DAOpportunityCoordinator singleton] resetOpportunityInstance];
        
        [self generateDemoData];
        
        
        
        [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_SUBJECT] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionSubject]];
        [self.config setCellCls:[AGTextfieldCell class] inSection:SectionSubject];
        
        [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_DESCRIPTION] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionDescription]];
        [self.config setCellCls:[AGTextfieldBoxCell class] inSection:SectionDescription];
        
        [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_COMPANY] atIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionCompany]];
        [self.config setCellCls:[AGTextfieldCell class] inSection:SectionCompany];
        
        [self earningPotentialSection];
        
        [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
        
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_CREATE_TEMPLATE]];
        
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        [self enableSeparators];
        
        
    }
    return self;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setLeftBarButtonItem:self.closeBtnItem];
}

- (void)generateDemoData{
    [self.item setCompany:[DACompany instanceWithName:@"Medicus"]];
    [self.item setName:@"5 steps to become top stylist"];
    [self.item setDesc:@"word word word word word word word word word word word word word word word word"];
}

#pragma mark - interactive ops

- (void)didTapNext:(id)sender{
    DATasksEditor *vc = [DATasksEditor instance];
    [vc setItem:self.item];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didTapClose:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == SectionSubject) {
//        TLOG(@"self.item -> %@", self.item.name);
        value = self.item.name;
    }
    
    if (section == SectionCompany) {
        value = self.item.company.name;
    }
    
    if (section == SectionDescription){
        value = self.item.desc;
    }
    
    if (section == SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_NEXT] target:self action:@selector(didTapNext:)]
                  ];
    }
    
    return value;
}

#pragma mark - components

- (DAEarningPotentialSection *)earningPotentialSection{
    if (!_earningPotentialSection) {
        _earningPotentialSection = [DAEarningPotentialSection instanceWithSection:SectionEarningPotential config:self.config];
        [_earningPotentialSection setItem:self.item];
    }
    return _earningPotentialSection;
}

- (UIBarButtonItem *)closeBtnItem{
    if (!_closeBtnItem) {
        _closeBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(didTapClose:)];
    }
    return _closeBtnItem;
}

#pragma mark - properties

- (DAOpportunity *)item{
    return [DAOpportunityCoordinator singleton].opportunityInstance;
}

@end
