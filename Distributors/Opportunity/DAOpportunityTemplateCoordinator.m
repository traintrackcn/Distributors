//
//  DAOpportunityTemplateCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAOpportunityTemplateCoordinator.h"
#import "DAOpportunityStep.h"
#import "DAOpportunityTask.h"
#import "DAOpportunity.h"
#import "DACompany.h"

@interface DAOpportunityTemplateCoordinator(){
    
}

@property (nonatomic, strong) NSMutableDictionary *data;

@property (nonatomic, strong) DAOpportunity *demoO;

@end

@implementation DAOpportunityTemplateCoordinator

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - remote ops

- (void)requestTemplatesByCompany:(DACompany *)company completion:(void (^)(NSArray *))completion{
    if (completion) {
        completion (@[self.demoO]);
    }
}


#pragma mark - properties

- (DAOpportunity *)demoO{
    if (!_demoO) {
        _demoO = [DAOpportunity instance];
    }
    return _demoO;
}

- (NSMutableDictionary *)data{
    if (!_data) {
        _data = [NSMutableDictionary dictionary];
    }
    return _data;
}

@end
