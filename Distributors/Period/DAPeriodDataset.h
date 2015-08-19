//
//  DAPeriodDataset.h
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADataset.h"

@class DAPeriod;
@interface DAPeriodDataset : DADataset

- (DAPeriod *)weekItem;
- (DAPeriod *)monthItem;

@end
