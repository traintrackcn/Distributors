//
//  DAMapCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAMapCell.h"
#import "DSDeviceUtil.h"
#import "GlobalDefine.h"
#import <MapKit/MapKit.h>
#import "DAStyleDefine.h"

@interface DAMapCell(){
    
}

@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation DAMapCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.mapView];
    }
    return self;
}

#pragma mark - components

- (MKMapView *)mapView{
    if (!_mapView) {
        CGFloat w = [DSDeviceUtil bounds].size.width;
        CGFloat h = self.height;
        _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
//        TLOG(@"h -> %f", h);
    }
    return _mapView;
}

#pragma mark - styles

+ (CGFloat)height{
    return [DSDeviceUtil bounds].size.height - STYLE_TAB_BAR_HEIGHT;
}

@end
