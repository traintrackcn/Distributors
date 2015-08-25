//
//  AGDashboardComponentChart+Utils.h
//  AboveGEM
//
//  Created by Tao Yunfei on 5/21/15.
//
//

#import "DAChartCell.h"

@interface DAChartCell (Utils)

- (NSArray *)standandrizeValuesFromArray:(NSArray *)arr maxAxisYValue:(NSNumber *)maxAxisYValue;
- (NSNumber *)findMaxAxisYValue:(NSArray *)list;

@end
