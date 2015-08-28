//
//  DAOpportunityTaskProgressEditor.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskProgressEditor.h"
#import "AGTextfieldCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "AGTextCoordinator.h"
#import "DATextDefine.h"

@interface DATaskProgressEditor(){
    
}

@property (nonatomic, strong) UIBarButtonItem *saveBtnItem;

@end

@implementation DATaskProgressEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_TASK_LOG]];
        
        [self.config setCellCls:[AGTextfieldCell class] inSection:0];
        
        for (NSInteger i = 0; i < 30; i++) {
            NSString *text = [NSString stringWithFormat:@"%ld/09/2015", (30-i)];
            [self.config setCellTitle:text atIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationItem setRightBarButtonItem:self.saveBtnItem];
}

#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - datasource

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    id value = @"0";
    return value;
}

#pragma mark - components

- (UIBarButtonItem *)saveBtnItem{
    if (!_saveBtnItem) {
        _saveBtnItem = [[UIBarButtonItem alloc] initWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] style:UIBarButtonItemStylePlain target:self action:@selector(didTapSave:)];
    }
    return _saveBtnItem;
}

@end
