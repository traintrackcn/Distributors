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

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation DACompanyCoordinator

- (instancetype)init{
    self = [super init];
    if (self) {
        [self.data addObject:[DACompany instanceWithName:@"BECOME"]];
        [self.data addObject:[DACompany instanceWithName:@"OG"]];
        [self.data addObject:[DACompany instanceWithName:@"WellnessPro"]];
    }
    return self;
}

#pragma mark - properties

- (NSMutableArray *)data{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}

- (NSArray *)items{
    return self.data;
}

@end
