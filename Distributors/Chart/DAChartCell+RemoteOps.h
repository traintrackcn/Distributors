//
//  AGDashboardComponentChart+RemoteOps.h
//  AboveGEM
//
//  Created by Tao Yunfei on 5/21/15.
//
//

#import "DAChartCell.h"

@interface DAChartCell (RemoteOps)

#pragma mark - remote ops
- (void)willRequest;
- (void)didRequest:(id)data;
- (void)request;
- (NSString *)requestType;

@end
