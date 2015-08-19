//
//  DACompanyCoordinator.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DADataset.h"

@class DACompany;
@interface DACompanyCoordinator : DADataset

- (void)requestSave:(DACompany *)company completion:(void(^)(id callback))completion;

@end
