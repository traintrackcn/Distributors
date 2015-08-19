//
//  DAOpportunityTemplateCoordinator.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DAOpportunity;
@class DACompany;

@interface DAOpportunityTemplateCoordinator : NSObject

- (void)requestTemplatesByCompany:(DACompany *)company completion:(void(^)(NSArray *templates))completion;

@end
