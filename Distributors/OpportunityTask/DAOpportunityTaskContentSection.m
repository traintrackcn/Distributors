//
//  DAOpportunityTaskContentSection.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTaskContentSection.h"
#import "AGVCConfiguration.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGTextfieldCell.h"
#import "DAOpportunityCoordinator.h"
#import "DAOpportunityTask.h"

@implementation DAOpportunityTaskContentSection

- (instancetype)initWithSection:(NSInteger)section config:(AGVCConfiguration *)config{
    self = [super initWithSection:section config:config];
    if (self) {
        
    }
    return self;
}

- (void)setItem:(DAOpportunityTask *)item{
    _item = item;
    
    if (self.type == DAOpportunityTaskTypeEvents) {
        
    }
    
    if (self.type == DAOpportunityTaskTypeContacts) {
        
    }
    
    if (self.type == DAOpportunityTaskTypeTraining) {
        
    }
    
    if (self.type == DAOpportunityTaskTypeAutoship) {
        
    }
    
    if (self.type == DAOpportunityTaskTypeProducts) {
        
    }
    
    [self.config setCellCls:[AGTextfieldCell class] inSection:self.section];
}

- (id)valueAtIndex:(NSInteger)index{
    return @"hello";
}

- (NSInteger)numberOfRows{
    if (self.type == DAOpportunityTaskTypeEvents) return 3;
    if (self.type == DAOpportunityTaskTypeContacts) return 3;
    if (self.type == DAOpportunityTaskTypeTraining) return 3;
    if (self.type == DAOpportunityTaskTypeAutoship) return 3;
    if (self.type == DAOpportunityTaskTypeProducts) return 3;
    return 1;
}

- (DAOpportunityTaskType)type{
    return self.item.type;
}

@end
