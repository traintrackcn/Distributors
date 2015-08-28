//
//  DALeaderViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DALeaderViewController.h"
#import "DALeaderBasicInfoCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGTextBoxCell.h"
#import "AGTextfieldCellStyleOptions.h"
#import "DALeaderOpportunityCell.h"
#import "DAStyleDefine.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionBasic,
    SectionOpportunity,
    SectionCount
};

typedef NS_ENUM(NSInteger, SectionBasicCell) {
    SectionBasicCellPortrait,
    SectionBasicCellBio,
    SectionBasicCellVideos,
    SectionBasicCellCommunity,
    SectionBasicCellCount
};

@implementation DALeaderViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"Leader Name"];
        [self.config setCellCls:[DALeaderBasicInfoCell class] atIndexPath:[NSIndexPath indexPathForRow:SectionBasicCellPortrait inSection:SectionBasic]];
        
        [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_BIO] atIndexPath:[NSIndexPath indexPathForRow:SectionBasicCellBio inSection:SectionBasic]];
        [self.config setCellCls:[AGTextBoxCell class] atIndexPath:[NSIndexPath indexPathForRow:SectionBasicCellBio inSection:SectionBasic]];
        
        [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_VIDEOS] atIndexPath:[NSIndexPath indexPathForRow:SectionBasicCellVideos inSection:SectionBasic]];
        [self.config setCellCls:[AGTextfieldCellStyleOptions class] atIndexPath:[NSIndexPath indexPathForRow:SectionBasicCellVideos inSection:SectionBasic]];
        
        [self.config setCellTitle:[AGTextCoordinator textForKey:KEY_LBL_COMMUNITY] atIndexPath:[NSIndexPath indexPathForRow:SectionBasicCellCommunity inSection:SectionBasic]];
        [self.config setCellCls:[AGTextfieldCellStyleOptions class] atIndexPath:[NSIndexPath indexPathForRow:SectionBasicCellCommunity inSection:SectionBasic]];
        
        [self.config setCellCls:[DALeaderOpportunityCell class] inSection:SectionOpportunity];
        
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
        [self enableSeparators];
        
    }
    return self;
}

#pragma mark - datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionBasic) return SectionBasicCellCount;
    if (section == SectionOpportunity) return 3;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value = [super valueAtIndexPath:indexPath];
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    if (section == SectionBasic) {
        if (idx == SectionBasicCellBio) {
            value = @"Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio Bio ";
        }
    }
    
    return value;
}

@end
