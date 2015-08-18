//
//  DALabViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/11/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DALabViewController.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "DADefine.h"
#import "AGTextCellStyleMore.h"
#import "AGViewController+Datasource.h"
#import "DALabConvertSpeechToTextViewController.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionItem,
    SectionCount
};

typedef NS_ENUM(NSInteger, SectionItemCell) {
    SectionItemCellConvertSpeechToText,
    SectionItemCellCount
};

@interface DALabViewController ()

@end

@implementation DALabViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_LAB]];
        [self.config setCellCls:[AGTextCellStyleMore class] inSection:SectionItem];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}



#pragma mark - table view stuff

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    NSInteger section = indexPath.section;
    id value;
    
    if (section == SectionItem) {
        if (idx == SectionItemCellConvertSpeechToText) {
            value = @"Convert Speech to Text";
        }
    }
    
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    NSInteger section = indexPath.section;
    
    if (section == SectionItem) {
        if (idx == SectionItemCellConvertSpeechToText) {
            DALabConvertSpeechToTextViewController *vc = [DALabConvertSpeechToTextViewController instance];
            [self.navigationController pushViewController:vc animated:YES];
            // goto 
        }
    }
    
    
}

@end
