//
//  AGChartCoordinatorView.m
//  AboveGEM
//
//  Created by Tao Yunfei on 5/18/15.
//
//

#import "DAChartCoordinatorView.h"
#import "JBLineChartView.h"
#import "AGStyleCoordinator.h"
#import "DSDraw.h"
#import "GlobalDefine.h"

@interface DAChartCoordinatorView(){

}

//@property (nonatomic, strong) UIView *axisX;
//@property (nonatomic, strong) UIView *axisY;
@property (nonatomic, assign) CGPoint ptZero;
@property (nonatomic, strong) NSArray *axisYLabels;
@property (nonatomic, strong) NSArray *axisXLabels;

@end

@implementation DAChartCoordinatorView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
//        [self setBackgroundColor:[UIColor whiteColor]];
//        [self assemble];
    }
}

#pragma mark - ops

- (void)reloadData{
    //reload axis
    [self assembleAxisXLabels];
    [self assembleAxisYLabels];
    [self reloadAxisXLabels];
    [self reloadAxisYLabels];
    
    [self setNeedsDisplay];
}

- (void)reloadAxisXLabels{
    for (NSInteger i = 0; i<self.axisXLabels.count; i++) {
        UILabel *l = [self.axisXLabels objectAtIndex:i];
        NSString *title = [self.delegate titleOfAxisXAtIndex:i];
        if (title) {
            [l setText:[NSString stringWithFormat:@"%@",title]];
        }
    }
}

- (void)reloadAxisYLabels{
    for (NSInteger i = 0; i<self.axisYLabels.count; i++) {
        UILabel *l = [self.axisYLabels objectAtIndex:i];
        NSString *title = [self.delegate titleOfAxisYAtIndex:i];
        if (title) {
            [l setText:[NSString stringWithFormat:@"%@",title]];
        }
    }
}

#pragma mark - assemble


- (void)assembleAxisYLabels{
    CGFloat h = 10;
    CGFloat y = self.yZero - h/2;
    NSMutableArray *tmpArr = [NSMutableArray array];
    NSInteger num = self.delegate.numberOfAxisYDots;
    for (NSInteger i = 0; i < num; i++) {
        
        CGFloat w = self.paddingL;
        CGRect frame = CGRectMake(0, y, w, h);
        UILabel *l = [self.axisYLabels objectAtIndex:i];
        
        if (!l) {
            l = [[UILabel alloc] initWithFrame:frame];
            [self addSubview:l];
            [l setTextAlignment:NSTextAlignmentCenter];
            [l setAdjustsFontSizeToFitWidth:YES];
            [l setTextColor:[UIColor whiteColor]];
            [l setFont:[AGStyleCoordinator fontWithSize:10.0]];
            [tmpArr addObject:l];
        }else{
            [l setFrame:frame];
        }
        
        y -= self.unitH;
    }
    
    [self setAxisYLabels:tmpArr];
}

- (void)assembleAxisXLabels{
    CGFloat h = 10;
    CGFloat y = self.yZero + 8;
    CGFloat w = 40;
    CGFloat x = self.chartView.frame.origin.x - w/2;
    NSInteger num = self.delegate.numberOfAxisXDots;
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (NSInteger i = 0; i < num; i++) {
        
        CGRect frame = CGRectMake(x, y, w, h);
        UILabel *l = [self.axisXLabels objectAtIndex:i];
        
        if (!l) {
            l = [[UILabel alloc] initWithFrame:frame];
            [self addSubview:l];
            [l setTextAlignment:NSTextAlignmentCenter];
            [l setAdjustsFontSizeToFitWidth:YES];
            [l setTextColor:[UIColor whiteColor]];
            [l setFont:[AGStyleCoordinator fontWithSize:10]];
            [tmpArr addObject:l];
//            [AGDebugUtil makeBorderForView:l];
        }else{
            [l setFrame:frame];
        }
        
        x += self.unitW ;
    }
    
    [self setAxisXLabels:tmpArr];
}

#pragma mark - components

- (void)drawRect:(CGRect)rect{
//    return;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawAxisX:ctx];
    [self drawReferenceAxisX:ctx];
    [self drawAxisY:ctx];
}


- (void)drawReferenceAxisX:(CGContextRef)ctx{
    NSInteger num = self.delegate.numberOfAxisYDots;
    CGFloat y = self.yZero;
    for (NSInteger i = 0; i < num; i++) {
        CGPoint startP = CGPointMake(self.xZero, y);
        CGPoint endP = CGPointMake(self.xMax, y);
        [DSDraw drawLine:ctx startPoint:startP endPoint:endP strokeColor:[UIColor whiteColor] lineWidth:self.axisW];
        y -= self.unitH;
    }
}

- (void)drawAxisX:(CGContextRef)ctx{
    CGFloat y = self.yZero;
    CGPoint startP = CGPointMake(self.xZero, y);
    CGPoint endP = CGPointMake(self.xMax, y);
    [DSDraw drawLine:ctx startPoint:startP endPoint:endP strokeColor:[UIColor whiteColor] lineWidth:self.axisW];
     
}

- (void)drawAxisY:(CGContextRef)ctx{
    CGPoint maxYP = CGPointMake(self.xZero, self.yMax);
    [DSDraw drawLine:ctx startPoint:maxYP endPoint:self.ptZero strokeColor:[UIColor whiteColor] lineWidth:self.axisW];
}

#pragma mark - properties

- (CGFloat)yMax{
    return self.paddingT;
}

- (CGFloat)xMax{
    return self.frame.size.width - self.paddingR;
}

- (CGPoint)ptZero{
    return CGPointMake(self.xZero, self.yZero);
}

- (CGFloat)xZero{
    return self.paddingL;
}

- (CGFloat)yZero{
    return self.frame.size.height - self.paddingB;
}

- (JBLineChartView *)chartView{
    return self.delegate.chartView;
}

- (CGFloat)unitH{
    return self.chartView.frame.size.height/(self.numberOfAxisYDots-1);
}

- (CGFloat)unitW{
    return self.chartView.frame.size.width/(self.numberOfAxisXDots-1);
}

- (NSInteger)numberOfAxisXDots{
    return self.delegate.numberOfAxisXDots;
}

- (NSInteger)numberOfAxisYDots{
    return self.delegate.numberOfAxisYDots;
}

#pragma mark - styles

- (CGFloat)paddingT{
    return 12.0;
}

- (CGFloat)paddingR{
    return self.delegate.paddingR;
}

- (CGFloat)titleH{
    return 44.0;
}

- (CGFloat)paddingL{
    return 32.0;
}

- (CGFloat)paddingB{
    return self.delegate.paddingB;
}

- (UIColor *)borderColor{
//    return RGBA(221, 221, 221, 1);
    return RGBA(204, 204, 204, 1);
}

- (CGFloat)axisW{
    return 1;
}

@end
