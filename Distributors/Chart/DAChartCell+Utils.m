//
//  AGDashboardComponentChart+Utils.m
//  AboveGEM
//
//  Created by Tao Yunfei on 5/21/15.
//
//

#import "DAChartCell+Utils.h"
#import "GlobalDefine.h"

@implementation DAChartCell (Utils)

#pragma mark - utils

- (NSArray *)standandrizeValuesFromArray:(NSArray *)arr maxAxisYValue:(NSNumber *)maxAxisYValue{
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i<arr.count; i++) {
        id item = [arr objectAtIndex:i];
        NSNumber *num;
        if ([item isKindOfClass:[NSNumber class]]) {
            num = item;
        }else{
            num = [item objectForKey:@"count"];
        }
        
//        TLOG(@"num -> %@", num);
        CGFloat standardrizeCount = num.floatValue/maxAxisYValue.floatValue;
        [tmpArr addObject:[NSNumber numberWithFloat:standardrizeCount]];
    }
    
    return tmpArr;
}

- (NSNumber *)findMaxAxisYValue:(NSArray *)list{
    NSMutableArray *tmpArr = [NSMutableArray array];
    
//    TLOG(@"list -> %@", list);
    
    for (NSInteger i = 0; i<list.count; i++) {
        NSArray *arr = [list objectAtIndex:i];
        for (NSInteger idx = 0; idx < arr.count; idx ++) {
            id item = [arr objectAtIndex:idx];
            NSNumber *num;
            if ([item isKindOfClass:[NSNumber class]]) {
                num = item;
            }else{
                num = [item objectForKey:@"count"];
            }
            [tmpArr addObject:num];
        }
        
    }
    
    
//        TLOG(@"tmpArr -> %@", tmpArr);
    
    NSInteger maxValue = [[tmpArr valueForKeyPath:@"@max.intValue"] integerValue];
     return [NSNumber numberWithInteger:maxValue];
//    TLOG(@"tmpArr -> %@", tmpArr);
    NSInteger maxCoordinatorValue = 1;
    //    NSInteger multiple = 1;
    
    while (maxValue > maxCoordinatorValue) {
        maxCoordinatorValue *= 10;
    }
    
    return [NSNumber numberWithInteger:maxCoordinatorValue];
}


@end
