//
//  DAOpportunityTaskContentSection.h
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGSectionUnit.h"
#import "DATaskDefine.h"

typedef NS_ENUM(NSInteger, SectionCell) {
    SectionCellType,
    SectionCellName
};

@class DATask;

@interface DATaskDefineSection : AGSectionUnit

- (DATaskType)type;

@property (nonatomic, strong) DATask *item;

@end
