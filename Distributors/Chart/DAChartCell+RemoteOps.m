//
//  AGDashboardComponentChart+RemoteOps.m
//  AboveGEM
//
//  Created by Tao Yunfei on 5/21/15.
//
//

#import "DAChartCell+RemoteOps.h"
#import "AGRemoteUnit.h"
//#import "AGDashboardComponentChart.h"

@implementation DAChartCell (RemoteOps)

//@synthesize rUnit = _rUnit;

#pragma mark - remote ops

- (void)willRequest{
    
}

- (NSString *)requestType{
    return nil;
}

- (void)request{
    [self willRequest];
    
    if (self.requestType) {
        [self.rUnit requestWithCompletion:^(id data, id error) {
            [self requestCallback:data error:error];
        }];
    }else{
        [self requestCallback:nil error:nil];
    }
    
    
}

- (void)requestCallback:(id)data error:(id)error{
    if (error) {
        return;
    }
//        TLOG(@"data -> %@", data);
    [self didRequest:data];
    [self reloadData];
}

- (void)didRequest:(id)data{
    
}

- (AGRemoteUnit *)rUnit{
    if (!_rUnit) {
        _rUnit = [AGRemoteUnit instance];
        [_rUnit setRequestType:self.requestType];
    }
    return _rUnit;
}

@end
