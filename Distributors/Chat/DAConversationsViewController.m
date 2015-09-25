//
//  DARecentChatsViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 7/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAConversationsViewController.h"
#import "DADefine.h"
#import "DATextDefine.h"
#import "DAStyleDefine.h"
#import "DSImage.h"
#import "DAConversationCell.h"
#import "DASearchCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAConversationViewController.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSearch,
    SectionItem,
    SectionCount
};

@interface DAConversationsViewController(){
    
}


@property (nonatomic, strong) UIBarButtonItem *addButtonItem;

@end

@implementation DAConversationsViewController



- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_CHAT]];
        [self.config setCellCls:[DASearchCell class] inSection:SectionSearch];
        [self.config setCellCls:[DAConversationCell class] inSection:SectionItem];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setRightBarButtonItem:self.addButtonItem];
}


#pragma mark - interactive ops

- (void)didTapAdd:(id)sender{
    
}



#pragma mark - table datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionSearch) return 1;
    if (section == SectionItem) return 3;
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    
    if (section == SectionItem) {
        DAConversationViewController *vc = [DAConversationViewController instance];
        [self pushViewController:vc];
    }
}

#pragma mark - components

- (UIBarButtonItem *)addButtonItem{
    if (!_addButtonItem) {
        _addButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconAdd"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapAdd:)];
    }
    return _addButtonItem;
}

@end
