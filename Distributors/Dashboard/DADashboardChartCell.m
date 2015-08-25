//
//  DADashboardChartCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADashboardChartCell.h"
#import "AGTextCoordinator.h"
#import "GlobalDefine.h"
#import "DAChartCell+Utils.h"

@implementation DADashboardChartCell

//- (NSString *)requestType{
//    return nil;
//}

- (NSArray *)titles{
    return @[
             [AGTextCoordinator titleDistributor],
             [AGTextCoordinator titleGroupEnrollment]
             ];
}

#pragma mark - remote ops

- (void)didRequest:(id)data{
    TLOG(@"data -> %@", data);
    NSMutableArray *tmpArr;
    NSArray *numberLog = @[@(1), @(3), @(2)];
//    NSArray *group = [data objectForKey:@"group"];
    //    TLOG(@"firstLevel -> %d %@", firstLevel.count,firstLevel);
    
    //find axis x dot's number
    [self setNumberOfAxisXDots:numberLog.count];
    
    //find axis x labels
    tmpArr = [NSMutableArray array];
    for (NSInteger i = 0; i<self.numberOfAxisXDots; i++) {
//        id item = [numberLog objectAtIndex:i];
        NSString *title = [NSString stringWithFormat:@"%ld/09/015", (i+1)];
        [tmpArr addObject:title];
    }
    
    [self setTitlesOfAxisX:tmpArr];
    
    //find axis y labels
    [self setNumberOfAxisYDots:2];
//    return;
    NSNumber *maxAxisYValue = [self findMaxAxisYValue:@[numberLog]];
//    return;
    [self setTitlesOfAxisY:@[
                             @0,
                             maxAxisYValue
                             ]];
    //    TLOG(@"maxCoordinatorValue -> %d", );
    
    //find data
    [self setData:@[
                    [self standandrizeValuesFromArray:numberLog maxAxisYValue:maxAxisYValue],
//                    [self standandrizeValuesFromArray:group maxAxisYValue:maxAxisYValue],
                    ]];
}

#pragma mark - styles

+ (CGFloat)height{
    return 208;
}

@end
