//
//  DAChartCell.h
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGCell.h"

@class AGRemoteUnit;

@interface DAChartCell : AGCell{
    AGRemoteUnit *_rUnit;
}


- (NSArray *)titles;
- (void)reloadData;


@property (nonatomic, strong) NSArray *titlesOfAxisX;
@property (nonatomic, strong) NSArray *titlesOfAxisY;

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) AGRemoteUnit *rUnit;


@property (nonatomic, assign) NSInteger numberOfAxisXDots;
@property (nonatomic, assign) NSInteger numberOfAxisYDots;

@end
