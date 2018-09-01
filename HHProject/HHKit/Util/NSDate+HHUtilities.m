//
//  NSDate+HHUtilities.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/5.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "NSDate+HHUtilities.h"


static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (HHUtilities)

+ (NSCalendar *) hh_currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - Relative Dates

+ (NSDate *) hh_dateWithDaysFromNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] hh_dateByAddingDays:days];
}

+ (NSDate *) hh_dateWithDaysBeforeNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] hh_dateBySubtractingDays:days];
}

+ (NSDate *) hh_dateTomorrow
{
    return [NSDate hh_dateWithDaysFromNow:1];
}

+ (NSDate *) hh_dateYesterday
{
    return [NSDate hh_dateWithDaysBeforeNow:1];
}

+ (NSDate *) hh_dateWithHoursFromNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + HH_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) hh_dateWithHoursBeforeNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - HH_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) hh_dateWithMinutesFromNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + HH_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) hh_dateWithMinutesBeforeNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - HH_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *) hh_stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *) hh_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    return [formatter stringFromDate:self];
}

+ (NSDate *)hh_dateWithString:(NSString *)dateString format:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

- (NSString *) hh_shortString
{
    return [self hh_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) hh_shortTimeString
{
    return [self hh_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) hh_shortDateString
{
    return [self hh_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) hh_mediumString
{
    return [self hh_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) hh_mediumTimeString
{
    return [self hh_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) hh_mediumDateString
{
    return [self hh_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) hh_longString
{
    return [self hh_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) hh_longTimeString
{
    return [self hh_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) hh_longDateString
{
    return [self hh_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL) hh_isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate hh_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate hh_currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL) hh_isToday
{
    return [self hh_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL) hh_isTomorrow
{
    return [self hh_isEqualToDateIgnoringTime:[NSDate hh_dateTomorrow]];
}

- (BOOL) hh_isYesterday
{
    return [self hh_isEqualToDateIgnoringTime:[NSDate hh_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL) hh_isSameWeekAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate hh_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate hh_currentCalendar] components:componentFlags fromDate:aDate];
    
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfYear != components2.weekOfYear) return NO;
    
    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < HH_D_WEEK);
}

- (BOOL) hh_isThisWeek
{
    return [self hh_isSameWeekAsDate:[NSDate date]];
}

- (BOOL) hh_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + HH_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self hh_isSameWeekAsDate:newDate];
}

- (BOOL) hh_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - HH_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self hh_isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL) hh_isSameMonthAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL) hh_isThisMonth
{
    return [self hh_isSameMonthAsDate:[NSDate date]];
}

// Thanks Marcin Krzyzanowski, also for adding/subtracting years and months
- (BOOL) hh_isLastMonth
{
    return [self hh_isSameMonthAsDate:[[NSDate date] hh_dateBySubtractingMonths:1]];
}

- (BOOL) hh_isNextMonth
{
    return [self hh_isSameMonthAsDate:[[NSDate date] hh_dateByAddingMonths:1]];
}

- (BOOL) hh_isSameYearAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

- (BOOL) hh_isThisYear
{
    // Thanks, baspellis
    return [self hh_isSameYearAsDate:[NSDate date]];
}

- (BOOL) hh_isNextYear
{
    NSDateComponents *components1 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year + 1));
}

- (BOOL) hh_isLastYear
{
    NSDateComponents *components1 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate hh_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year - 1));
}

- (BOOL) hh_isLeapMonth
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL) hh_isLeapYear
{
    NSUInteger year = self.hh_year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL) hh_isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) hh_isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL) hh_isInFuture
{
    return ([self hh_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL) hh_isInPast
{
    return ([self hh_isEarlierThanDate:[NSDate date]]);
}


#pragma mark - Roles
- (BOOL) hh_isTypicallyWeekend
{
    NSDateComponents *components = [[NSDate hh_currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL) hh_isTypicallyWorkday
{
    return ![self hh_isTypicallyWeekend];
}

#pragma mark - Adjusting Dates

// Thaks, rsjohnson
- (NSDate *) hh_dateByAddingYears: (NSInteger) dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSDate hh_currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) hh_dateBySubtractingYears: (NSInteger) dYears
{
    return [self hh_dateByAddingYears:-dYears];
}

- (NSDate *) hh_dateByAddingMonths: (NSInteger) dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSDate hh_currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) hh_dateBySubtractingMonths: (NSInteger) dMonths
{
    return [self hh_dateByAddingMonths:-dMonths];
}

// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *) hh_dateByAddingDays: (NSInteger) dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSDate hh_currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) hh_dateBySubtractingDays: (NSInteger) dDays
{
    return [self hh_dateByAddingDays: (dDays * -1)];
}

- (NSDate *) hh_dateByAddingHours: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + HH_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) hh_dateBySubtractingHours: (NSInteger) dHours
{
    return [self hh_dateByAddingHours: (dHours * -1)];
}

- (NSDate *) hh_dateByAddingMinutes: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + HH_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) hh_dateBySubtractingMinutes: (NSInteger) dMinutes
{
    return [self hh_dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *) hh_componentsWithOffsetFromDate: (NSDate *) aDate
{
    NSDateComponents *dTime = [[NSDate hh_currentCalendar] components:componentFlags fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

- (NSDate *) hh_dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate hh_currentCalendar] components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate hh_currentCalendar] dateFromComponents:components];
}

// Thanks gsempe & mteece
- (NSDate *) hh_dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate hh_currentCalendar] components:componentFlags fromDate:self];
    components.hour = 23; // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate hh_currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger) hh_minutesAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / HH_D_MINUTE);
}

- (NSInteger) hh_minutesBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / HH_D_MINUTE);
}

- (NSInteger) hh_hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / HH_D_HOUR);
}

- (NSInteger) hh_hoursBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / HH_D_HOUR);
}

- (NSInteger) hh_daysAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / HH_D_DAY);
}

- (NSInteger) hh_daysBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / HH_D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)hh_distanceInDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark - Decomposing Dates

- (NSInteger)hh_year
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)hh_month
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)hh_day
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hh_hour
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)hh_minute
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)hh_second
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)hh_nanosecond
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)hh_weekday
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)hh_weekdayOrdinal
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)hh_weekOfMonth
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)hh_weekOfYear
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)hh_yearForWeekOfYear
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)hh_quarter
{
    return [[[NSDate hh_currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

@end
