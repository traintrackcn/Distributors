//
//  DANewCompanyViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DANewCompanyViewController.h"
#import "AGTextCoordinator.h"
#import "DATextKeyDefine.h"
#import "DADefine.h"
#import "DACompany.h"
#import "DAOpportunityStep.h"
#import "GlobalDefine.h"
#import "DACurrencyDataset.h"
#import "NSObject+Singleton.h"
#import "DACurrency.h"


@interface DANewCompanyViewController (){
    
}

@property (nonatomic, strong) DACompany *company;

@end

@implementation DANewCompanyViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_CREATE]];
        
//        TLOG(@"currencies -> %@", [DACurrencyDataset singleton].items);
//        NSArray *items = [DACurrencyDataset singleton].items;
//        for (NSInteger i = 0; i< items.count; i++) {
//            DACurrency *item = [items objectAtIndex:i];
//            TLOG(@"item -> %@ %@", item.code, item.symbol);
//        }
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


#pragma mark - properties

- (DACompany *)company{
    if (!_company) {
        _company = [DACompany instance];
    }
    return _company;
}

- (NSArray *)steps{
    return @[];
}

@end
