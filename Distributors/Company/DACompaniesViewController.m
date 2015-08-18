//
//  DACompaniesViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACompaniesViewController.h"
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
#import "DANewCompanyViewController.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionSearch,
    SectionNewItem,
    SectionItem,
    SectionCount
};

@interface DACompaniesViewController (){
    
}

@property (nonatomic, strong) DACompany *dummyItem;

@end

@implementation DACompaniesViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_OPPORTUNITY]];
        [self.config setCellCls:[AGSearchCell class] inSection:SectionSearch];
        [self.config setCellCls:[DACompanyCell class] inSection:SectionNewItem];
        [self.config setCellCls:[DACompanyCell class] inSection:SectionItem];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
//    NSInteger idx = indexPath.row;
    
    if (section == SectionNewItem){
        DANewCompanyViewController *vc = [DANewCompanyViewController instance];
        [self.parentViewController.navigationController pushViewController:vc animated:YES];
    }
    
    if (section == SectionItem) {
//        DAOpportunitiesViewController *vc = [DAOpportunitiesViewController instance];
//        TLOG(@"self.naviC -> %@", self.navigationController);
//        [self.parentViewController.navigationController pushViewController:vc animated:YES];
    }
    
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
