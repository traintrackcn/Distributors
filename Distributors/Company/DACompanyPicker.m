//
//  DACompaniesViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACompanyPicker.h"
#import "AGSearchCell.h"
#import "DACompanyCell.h"
#import "AGViewController+Datasource.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "AGStyleCoordinator.h"
#import "GlobalDefine.h"
#import "NSObject+Singleton.h"
#import "DACompanyCoordinator.h"
#import "DACompany.h"
#import "DAOpportunityTemplateEditor.h"
#import "DAOpportunityDataset.h"
#import "DAOpportunityBasicEditor.h"
#import "DADefine.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSearch,
    SectionNewItem,
    SectionItem,
    SectionCount
};

@interface DACompanyPicker (){
    
}

@property (nonatomic, strong) DACompany *dummyItem;
@property (nonatomic, strong) UIBarButtonItem *closeBtnItem;

@end

@implementation DACompanyPicker

- (instancetype)init{
    self = [super init];
    if (self) {
//        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY_TEMPLATE]];
        [self.config setCellCls:[AGSearchCell class] inSection:SectionSearch];
        [self.config setCellCls:[DACompanyCell class] inSection:SectionNewItem];
        [self.config setCellCls:[DACompanyCell class] inSection:SectionItem];
        
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    TLOG(@"self.navigationController -> %@", self.tabBarController);
    
//    [self.tabBarController setTabBarItem:[UITabBarItem alloc]]
//    [self assembleTabBar];
    //setting navigation bar only
    [self.navigationItem setTitle:[AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY_TEMPLATE]];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setLeftBarButtonItem:self.closeBtnItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - interactive ops

- (void)didTapClose:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - table view data

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionSearch) return 1;
    if (section == SectionNewItem) return 1;
    if (section == SectionItem) return self.items.count;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    NSInteger section = indexPath.section;
    id value;
    
    if (section == SectionNewItem){
        value = self.dummyItem;
    }
    
    if (section == SectionItem) {
        value = [self.items objectAtIndex:idx];
    }
    
    return value;
}

- (id)valueForHeaderOfSection:(NSInteger)section{
    id value;
    if (section == SectionNewItem) {
        value = [AGTextCoordinator textForKey:KEY_LBL_COMPANIES];
    }
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    if (section == SectionNewItem){
        DAOpportunityBasicEditor *vc = [DAOpportunityBasicEditor instance];
        [self pushViewController:vc];
    }
    
    if (section == SectionItem) {
        DAOpportunityTemplateEditor *vc = [DAOpportunityTemplateEditor instance];
//        TLOG(@"self.naviC -> %@", self.navigationController);
        DACompany *item = [self.items objectAtIndex:idx];
        [vc setCompany:item];
        
        [[DAOpportunityDataset singleton] requestTemplatesByCompany:item completion:^(NSArray *templates) {
            [vc setItem:templates.firstObject];
            [self pushViewController:vc];
        }];
        
        
        
    }
    
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I"];
//}

#pragma mark - components

- (UIBarButtonItem *)closeBtnItem{
    if (!_closeBtnItem) {
        _closeBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(didTapClose:)];
    }
    return _closeBtnItem;
}


#pragma mark - properties

- (NSArray *)items{
    return [DACompanyCoordinator singleton].items;
}

- (DACompany *)dummyItem{
    if (!_dummyItem) {
        _dummyItem = [DACompany instance];
    }
    return _dummyItem;
}

@end
