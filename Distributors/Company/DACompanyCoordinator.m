//
//  DACompanyCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACompanyCoordinator.h"
#import "DACompany.h"

@interface DACompanyCoordinator(){
    
}

@end

@implementation DACompanyCoordinator

- (instancetype)init{
    self = [super init];
    if (self) {
        [self declareDatasetIsArray];
        [self.data addObject:[DACompany instanceWithName:@"BECOME"]];
        [self.data addObject:[DACompany instanceWithName:@"OG"]];
        [self.data addObject:[DACompany instanceWithName:@"WellnessPro"]];
    }
    return self;
}


#pragma mark - remote ops

- (void)requestSave:(DACompany *)company completion:(void (^)(id))completion{
    [self.data addObject:company];
    completion(nil);
}

@end
