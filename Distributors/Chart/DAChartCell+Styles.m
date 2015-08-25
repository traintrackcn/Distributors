//
//  AGDashboardComponentChart+Styles.m
//  AboveGEM
//
//  Created by Tao Yunfei on 5/21/15.
//
//

#import "DAChartCell+Styles.h"
#import "GlobalDefine.h"
#import "DAStyleDefine.h"

@implementation DAChartCell (Styles)

#pragma mark - styles

- (CGFloat)paddingT{
    return 42.0;
}

- (CGFloat)paddingR{
    return 24.0;
}

- (CGFloat)titleH{
    return 44.0;
}

- (CGFloat)paddingL{
    return 64.0;
}

- (CGFloat)paddingB{
    return 35.0;
}

- (UIColor *)borderColor{
    return [UIColor whiteColor];
}

- (NSArray *)lineColors{
    return @[
             [UIColor whiteColor],
             RGBA(61, 177, 80, 1)
             ];
}

- (CGFloat)paddingLR{
    return STYLE_PADDING_LR_DEFAULT;
}

@end
