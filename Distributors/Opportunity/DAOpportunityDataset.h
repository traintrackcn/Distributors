//
//  DAOpportunityTemplateCoordinator.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DADataset.h"

@class DACompany;
@class DAOpportunity;

@interface DAOpportunityDataset : DADataset

- (void)requestTemplatesByCompany:(DACompany *)company completion:(void(^)(NSArray *templates))completion;

@property (nonatomic, strong) NSArray *demoTasksOngoing;
@property (nonatomic, strong) NSArray *demoTasksCompleted;


@property (nonatomic, strong) DAOpportunity *demoOpportunity;





@end
