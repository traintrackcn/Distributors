//
//  DAOpportunityProgressViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityProgressViewController.h"
#import "DAOpportunity.h"
#import "AGTextCell.h"
#import "AGButtonCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"

typedef NS_ENUM(NSInteger, Section){
    SectionLeader,
    SectionStep,
    SectionButton,
    SectionCount
};

@implementation DAOpportunityProgressViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self.config setCellCls:[AGTextCell class] inSection:SectionLeader];
        [self.config setCellCls:[AGTextCell class] inSection:SectionStep];
        [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
    }
    return self;
}


- (void)setItem:(DAOpportunity *)item{
    _item = item;
    [self setTitle:item.name];
}

#pragma mark - 

- (NSInteger)numberOfSections{
    return <#expression#>
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

@end
