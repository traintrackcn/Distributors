//
//  DADatePickerCell.m
//  Distributors
//
//  Created by Tao Yunfei on 9/7/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADatePickerCell.h"
#import "RSDFDatePickerView.h"
#import "DAStyleDefine.h"
#import "DSImage.h"

@interface DADatePickerCell()<RSDFDatePickerViewDelegate, RSDFDatePickerViewDataSource>{
    
}

@property (nonatomic, strong) RSDFDatePickerView *datePickerView;
@property (nonatomic, strong) NSMutableArray *datesToMark;
//@property (nonatomic, strong) NSMutableDictionary *statesOfTasks;
@property (copy, nonatomic) NSDateFormatter *dateFormatter;
@property (copy, nonatomic) UIColor *completedTasksColor;
@property (copy, nonatomic) UIColor *uncompletedTasksColor;
@property (copy, nonatomic) NSDate *today;
@property (strong, nonatomic) NSCalendar *calendar;

@end

@implementation DADatePickerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.datePickerView];
        [self.contentView addSubview:self.borderBottomViewStyleSolid];
        
//        TLOG(@"datesToMark -> %@",self.datesToMark);
    }
    return self;
}


#pragma mark - interactive ops

- (void)didTapToday:(UIBarButtonItem *)sender{
    [self.datePickerView scrollToToday:YES];
}

#pragma mark - components

- (RSDFDatePickerView *)datePickerView{
    if (!_datePickerView) {
        CGRect frame = CGRectMake(0, 0, STYLE_DEVICE_WIDTH, self.height);
        _datePickerView = [[RSDFDatePickerView alloc] initWithFrame:frame calendar:self.calendar];
        _datePickerView.delegate = self;
        _datePickerView.dataSource = self;
        [_datePickerView selectDate:[NSDate date]];
//        _datePickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _datePickerView;
}


#pragma mark - RSDFDatePickerViewDataSource

- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldHighlightDate:(NSDate *)date
{
    return YES;
}

- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldSelectDate:(NSDate *)date
{
    
    TLOG(@"date -> %@", date);
    return YES;
}

- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldMarkDate:(NSDate *)date
{
//    TLOG(@"date -> %@  %@", date, self.datesToMark );
//    TLOG(@"[self.datesToMark containsObject:date] -> %d", [self.datesToMark containsObject:date]);
//    return [self.datesToMark containsObject:date];
    if (arc4random()%10>2) return NO;
    return YES;
}

- (UIColor *)datePickerView:(RSDFDatePickerView *)view markImageColorForDate:(NSDate *)date
{
    if (arc4random()%4>2) {
        return self.uncompletedTasksColor;
    } else {
        return self.completedTasksColor;
    }
}

//- (UIImage *)datePickerView:(RSDFDatePickerView *)view markImageForDate:(NSDate *)date{
//    UIImage *img = [UIImage imageNamed:@"IconFav"];
//    return [DSImage image:img withMaskColor:STYLE_THEME_COLOR];
//}

#pragma mark - styles

+ (CGFloat)height{
    return ((STYLE_DEVICE_HEIGHT - STYLE_STATUS_BAR_HEIGHT - STYLE_NAVIGATION_BAR_HEIGHT)/4.0)*3.0;
}

#pragma mark - properties

- (void)setCalendar:(NSCalendar *)calendar
{
    if (![_calendar isEqual:calendar]) {
        _calendar = calendar;
        
        self.title = [_calendar.calendarIdentifier capitalizedString];
    }
}

- (NSMutableArray *)datesToMark
{
    if (!_datesToMark) {
        NSArray *numberOfDaysFromToday = @[ @(2), @(4), @(8), @(13), @(22)];
        _datesToMark = [NSMutableArray array];
        
        for (NSInteger i = 0; i< numberOfDaysFromToday.count; i++) {
            NSInteger day = [[numberOfDaysFromToday objectAtIndex:i] integerValue];
            NSDate *date = [NSDate dateWithTimeIntervalSinceNow:day*3600*24];
            [_datesToMark addObject:date];
        }
        
        
    }
    return _datesToMark;
}



- (NSDate *)today
{
    if (!_today) {
        NSDateComponents *todayComponents = [self.calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
        _today = [self.calendar dateFromComponents:todayComponents];
    }
    return _today;
}

- (UIColor *)completedTasksColor
{
    return STYLE_THEME_COLOR_2;
}

- (UIColor *)uncompletedTasksColor
{
    return STYLE_TEXT_COLOR_SUBTITLE;
}

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setCalendar:self.calendar];
        [_dateFormatter setLocale:[self.calendar locale]];
        [_dateFormatter setDateStyle:NSDateFormatterFullStyle];
    }
    return _dateFormatter;
}


@end
