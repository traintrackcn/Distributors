//
//  AGChartCoordinatorView.h
//  AboveGEM
//
//  Created by Tao Yunfei on 5/18/15.
//
//

#import <UIKit/UIKit.h>
//#import "JBBarChartView.h"

@class JBLineChartView;

@protocol DAChartCoordinatorViewDelegate <NSObject>

@optional
- (UIColor *)borderColor;
- (JBLineChartView *)chartView;
- (CGFloat)paddingB;
- (CGFloat)paddingR;
- (NSInteger)numberOfAxisXDots;
- (NSInteger)numberOfAxisYDots;
- (NSString *)titleOfAxisXAtIndex:(NSInteger)index;
- (NSString *)titleOfAxisYAtIndex:(NSInteger)index;

@end


@interface DAChartCoordinatorView : UIView

- (void)reloadData;

@property (nonatomic, weak) id<DAChartCoordinatorViewDelegate> delegate;

@end
