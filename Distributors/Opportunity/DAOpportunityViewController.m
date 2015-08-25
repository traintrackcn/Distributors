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
#import "DAOpportunityStepSection.h"
#import "AGTextCellStyleTitleOnly.h"
#import "DAOpportunityLeaderCell.h"
#import "DAOpportunityDescriptionCell.h"
#import "AGButtonCell.h"
#import "DAStyleDefine.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGTextCoordinator.h"
#import "DAOpportunity.h"
#import "AGButtonItem.h"
#import "DATextKeyDefine.h"
#import "UIActionSheet+Blocks.h"

typedef NS_ENUM(NSInteger, Section){
    SectionSeparator,
    SectionInfo,
    SectionStep,
    SectionButton,
    SectionCount
};

typedef NS_ENUM(NSInteger, SectionInfoCell) {
    SectionInfoCellTitle,
    SectionInfoCellLeader,
    SectionInfoCellDescription,
    SectionInfoCellCount
};

@interface DAOpportunityViewController(){
    
}

@property (nonatomic, strong) DAOpportunityStepSection *stepSection;

@end

@implementation DAOpportunityViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)configSections{
    [self.config setCellHeight:0 atFirstIndexPathInSection:SectionSeparator];
    [self.config setCellCls:[AGCell class] inSection:SectionSeparator];
    
    [self.config setCellCls:[AGTextCellStyleTitleOnly class] atIndexPath:[NSIndexPath indexPathForItem:SectionInfoCellTitle inSection:SectionInfo]];
    [self.config setCellCls:[DAOpportunityLeaderCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionInfoCellLeader inSection:SectionInfo]];
    [self.config setCellCls:[DAOpportunityDescriptionCell class] atIndexPath:[NSIndexPath indexPathForItem:SectionInfoCellDescription inSection:SectionInfo]];
    //        [self.config setCellCls:[AGTextCell class] inSection:SectionStep];
    [self stepSection];
    
    
    [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
    
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
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionSeparator) return 1;
    if (section == SectionInfo) return SectionInfoCellCount;
    if (section == SectionButton) return 1;
    return [super numberOfRowsInSection:section];
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == SectionInfo) {
        if (idx == SectionInfoCellTitle) {
            value = self.item.name;
        }
    }
    
    if (section == SectionButton) {
        value = @[
                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_START] target:self action:@selector(didTapStart:)]
                  ];
    }
    
    return value;
}

#pragma mark - components

- (DAOpportunityStepSection *)stepSection{
    if (!_stepSection) {
        _stepSection = [DAOpportunityStepSection instanceWithSection:SectionStep config:self.config];
        [_stepSection setItem:self.item];
    }
    return _stepSection;
}


@end
