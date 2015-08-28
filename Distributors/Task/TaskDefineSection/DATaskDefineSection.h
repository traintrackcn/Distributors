//
//  DAOpportunityTaskContentSection.h
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGSectionUnit.h"
#import "DAOpportunityCoordinator.h"

typedef NS_ENUM(NSInteger, SectionCell) {
    SectionCellType,
    SectionCellName
};

@class DATask;

@interface DATaskDefineSection : AGSectionUnit

- (DAOpportunityTaskType)type;

@property (nonatomic, strong) DATask *item;

@end
