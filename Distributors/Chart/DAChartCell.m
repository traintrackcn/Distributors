//
//  DAChartCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/25/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAChartCell.h"

#import "DAChartCell.h"
#import "JBLineChartView.h"
#import "DAChartCoordinatorView.h"
//#import "AGChartTitleView.h"
#import "GlobalDefine.h"
#import "DAChartCell+RemoteOps.h"
#import "DAChartCell+Styles.h"
#import "DSDeviceUtil.h"
#import "DAStyleDefine.h"

@interface DAChartCell()<JBLineChartViewDelegate, JBLineChartViewDataSource, DAChartCoordinatorViewDelegate>{
    
}

@property (nonatomic, strong) JBLineChartView *chartView;
@property (nonatomic, strong) DAChartCoordinatorView *coordinatorView;

@property (nonatomic, strong) UIView *container;

@property (nonatomic, strong) UIView *borderViewAboveTitle;
@property (nonatomic, strong) UIView *borderViewUnderTitle;
//@property (nonatomic, strong) UIView *borderViewBottom;

//@property (nonatomic, strong) AGRemoteUnit *rUnit;
//@property (nonatomic, strong) NSArray *titleLabels;



@end

@implementation DAChartCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.borderViewAboveTitle];
        [self.contentView addSubview:self.container];
        [self.contentView addSubview:self.borderViewUnderTitle];
        [self.contentView addSubview:self.titleLabel];
        [self.container addSubview:self.chartView];
        [self.container insertSubview:self.coordinatorView atIndex:0];
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
    }
    return self;
}


#pragma mark - setter

- (void)setValue:(id)value{
    [super setValue:value];
    [self request];
}


#pragma mark -

- (void)reloadData{
    [self.chartView reloadData];
    [self.coordinatorView reloadData];
//    [self assembleTitleLabels];
}

#pragma mark - components

- (UIView *)container{
    if (!_container) {
        CGFloat y = self.titleH;
        CGFloat w = [DSDeviceUtil bounds].size.width;
        CGFloat h = self.height - y;
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, y, w, h)];
    }
    return _container;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        CGFloat x = self.paddingLR;
        CGFloat h = self.titleH;
        CGFloat w = [DSDeviceUtil bounds].size.width - x*2;
        CGFloat y = 0;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_titleLabel setFont:[AGStyleCoordinator fontWithSize:13]];
        //        _titleLabel.layer.borderWidth = 1;
//        [_titleLabel setText:@"Contact Created"];
    }
    return _titleLabel;
}

- (DAChartCoordinatorView *)coordinatorView{
    if (!_coordinatorView) {
        CGFloat w = self.container.frame.size.width;
        CGFloat h = self.container.frame.size.height;
        _coordinatorView = [[DAChartCoordinatorView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        [_coordinatorView setDelegate:self];
        [_coordinatorView setBackgroundColor:RGBA(31, 185, 250, 1)];
        //        [_coordinatorView setChartView:self.chartView];
    }
    return _coordinatorView;
}

- (JBLineChartView *)chartView{
    if (!_chartView) {
        CGFloat x = self.paddingL;
        CGFloat y = self.paddingT;
        CGFloat w = self.container.frame.size.width - x - self.paddingR;
        CGFloat h = self.container.frame.size.height - self.paddingT - self.paddingB;
        _chartView = [[JBLineChartView alloc] init];
        [_chartView setState:JBChartViewStateExpanded];
        [_chartView setDelegate:self];
        [_chartView setDataSource:self];
        [_chartView setFrame:CGRectMake(x, y, w, h)];
        //        [AGDebugUtil makeBorderForView:_chartView];
        [_chartView reloadData];
    }
    return _chartView;
}

- (UIView *)borderViewAboveTitle{
    if (!_borderViewAboveTitle) {
        CGFloat w = [DSDeviceUtil bounds].size.width;
        CGFloat h = .5f;
        _borderViewAboveTitle = [self assembleBorderView];
        [_borderViewAboveTitle setFrame:CGRectMake(0, 0, w, h)];
    }
    return _borderViewAboveTitle;
}

- (UIView *)borderViewUnderTitle{
    if (!_borderViewUnderTitle) {
        CGFloat w = [DSDeviceUtil bounds].size.width;
        CGFloat h = .5f;
        CGFloat y = self.titleH;
        _borderViewUnderTitle = [self assembleBorderView];
        [_borderViewUnderTitle setFrame:CGRectMake(0, y, w, h)];
    }
    return _borderViewUnderTitle;
}


#pragma mark -

- (NSArray *)data{
    if (!_data) {
        return @[];
    }
    return _data;
}


#pragma mark - AGChartCoordinatorDelegate



- (NSString *)titleOfAxisXAtIndex:(NSInteger)index{
    @try {
        return [self.titlesOfAxisX objectAtIndex:index];
    }@catch (NSException *exception) {
        return @"";
    }
}

- (NSString *)titleOfAxisYAtIndex:(NSInteger)index{
    @try {
        return [self.titlesOfAxisY objectAtIndex:index];
    }@catch (NSException *exception) {
        return @"";
    }
}

//#pragma mark - AGChartTitleViewDelegate
//
//- (UIColor *)chartTitleIndicatorColorAtLineIndex:(NSInteger)lineIndex{
//    return [self colorOfLine:lineIndex];
//}
//
//- (NSString *)chartTitleAtLineIndex:(NSInteger)lineIndex{
//    return [self titleOfLine:lineIndex];
//}

#pragma mark - AGDashboardChartDataSource

- (NSInteger)numberOfLines{
    return [self.data count];
}

- (NSInteger)numberOfValuesAtLineIndex:(NSInteger)lineIndex{
    NSArray *lineValues = [self valuesAtLineIndex:lineIndex];
    return lineValues.count;
}

- (CGFloat)valueAtIndex:(NSInteger)index lineIndex:(NSInteger)lineIndex{
    NSArray *lineValues = [self valuesAtLineIndex:lineIndex];
    return [[lineValues objectAtIndex:index] floatValue];
}

- (NSArray *)valuesAtLineIndex:(NSInteger)lineIndex{
    return [self.data objectAtIndex:lineIndex];
}

- (UIColor *)colorOfLine:(NSInteger)lineIndex{
    return [self.lineColors objectAtIndex:lineIndex];
}

//- (NSString *)titleOfLine:(NSInteger)lineIndex{
//    return [self.titles objectAtIndex:lineIndex];
//}



#pragma mark - JBChartViewDataSource

- (BOOL)shouldExtendSelectionViewIntoHeaderPaddingForChartView:(JBChartView *)chartView
{
    return NO;
}

- (BOOL)shouldExtendSelectionViewIntoFooterPaddingForChartView:(JBChartView *)chartView
{
    return NO;
}

#pragma mark - JBLineChartViewDataSource



- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView
{
    return self.numberOfLines;
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex
{
    return [self numberOfValuesAtLineIndex:lineIndex];
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView showsDotsForLineAtLineIndex:(NSUInteger)lineIndex
{
    return YES;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex
{
    return NO;
}

#pragma mark - JBLineChartViewDelegate

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return [self valueAtIndex:horizontalIndex lineIndex:lineIndex];
}

- (void)lineChartView:(JBLineChartView *)lineChartView didSelectLineAtIndex:(NSUInteger)lineIndex horizontalIndex:(NSUInteger)horizontalIndex touchPoint:(CGPoint)touchPoint
{
    //    NSNumber *valueNumber = [[self.chartData objectAtIndex:lineIndex] objectAtIndex:horizontalIndex];
    //    [self.informationView setValueText:[NSString stringWithFormat:@"%.2f", [valueNumber floatValue]] unitText:kJBStringLabelMm];
    //    [self.informationView setTitleText:lineIndex == JBLineChartLineSolid ? kJBStringLabelMetropolitanAverage : kJBStringLabelNationalAverage];
    //    [self.informationView setHidden:NO animated:YES];
    //    [self setTooltipVisible:YES animated:YES atTouchPoint:touchPoint];
    //    [self.tooltipView setText:[[self.daysOfWeek objectAtIndex:horizontalIndex] uppercaseString]];
}

- (void)didDeselectLineInLineChartView:(JBLineChartView *)lineChartView
{
    //    [self.informationView setHidden:YES animated:YES];
    //    [self setTooltipVisible:NO animated:YES];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [self colorOfLine:lineIndex];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return [self colorOfLine:lineIndex];
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex
{
    return 1;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView dotRadiusForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return 3;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView verticalSelectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [self colorOfLine:lineIndex];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [self colorOfLine:lineIndex];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionColorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return [self colorOfLine:lineIndex];
}

- (JBLineChartViewLineStyle)lineChartView:(JBLineChartView *)lineChartView lineStyleForLineAtLineIndex:(NSUInteger)lineIndex
{
    return JBLineChartViewLineStyleSolid;
}

#pragma mark - style

- (void)applySelectedStyle{
    
}

@end
