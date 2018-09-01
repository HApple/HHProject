//
//  NSDate+HHUtilities.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/5.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


#define HH_D_MINUTE	60
#define HH_D_HOUR		3600
#define HH_D_DAY		86400
#define HH_D_WEEK		604800
#define HH_D_YEAR		31556926

@interface NSDate (HHUtilities)

+ (NSCalendar *) hh_currentCalendar; // avoid bottlenecks

// Relative dates from the current date
+ (NSDate *) hh_dateTomorrow;
+ (NSDate *) hh_dateYesterday;
+ (NSDate *) hh_dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) hh_dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) hh_dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) hh_dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) hh_dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) hh_dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Short string utilities
- (NSString *) hh_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString *) hh_stringWithFormat: (NSString *) format;//e.g. @"yyyy-MM-dd HH:mm:ss"
+ (NSDate *)hh_dateWithString:(NSString *)dateString format:(NSString *)format;

@property (nonatomic, readonly) NSString *hh_shortString;
@property (nonatomic, readonly) NSString *hh_shortDateString;
@property (nonatomic, readonly) NSString *hh_shortTimeString;
@property (nonatomic, readonly) NSString *hh_mediumString;
@property (nonatomic, readonly) NSString *hh_mediumDateString;
@property (nonatomic, readonly) NSString *hh_mediumTimeString;
@property (nonatomic, readonly) NSString *hh_longString;
@property (nonatomic, readonly) NSString *hh_longDateString;
@property (nonatomic, readonly) NSString *hh_longTimeString;

// Comparing dates
- (BOOL) hh_isEqualToDateIgnoringTime: (NSDate *) aDate;

- (BOOL) hh_isToday;
- (BOOL) hh_isTomorrow;
- (BOOL) hh_isYesterday;

- (BOOL) hh_isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) hh_isThisWeek;
- (BOOL) hh_isNextWeek;
- (BOOL) hh_isLastWeek;

- (BOOL) hh_isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) hh_isThisMonth;
- (BOOL) hh_isNextMonth;
- (BOOL) hh_isLastMonth;

- (BOOL) hh_isSameYearAsDate: (NSDate *) aDate;
- (BOOL) hh_isThisYear;
- (BOOL) hh_isNextYear;
- (BOOL) hh_isLastYear;

- (BOOL) hh_isLeapMonth;
- (BOOL) hh_isLeapYear;

- (BOOL) hh_isEarlierThanDate: (NSDate *) aDate;
- (BOOL) hh_isLaterThanDate: (NSDate *) aDate;

- (BOOL) hh_isInFuture;
- (BOOL) hh_isInPast;

// Date roles
- (BOOL) hh_isTypicallyWorkday;
- (BOOL) hh_isTypicallyWeekend;

// Adjusting dates
- (NSDate *) hh_dateByAddingYears: (NSInteger) dYears;
- (NSDate *) hh_dateBySubtractingYears: (NSInteger) dYears;
- (NSDate *) hh_dateByAddingMonths: (NSInteger) dMonths;
- (NSDate *) hh_dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate *) hh_dateByAddingDays: (NSInteger) dDays;
- (NSDate *) hh_dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) hh_dateByAddingHours: (NSInteger) dHours;
- (NSDate *) hh_dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) hh_dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) hh_dateBySubtractingMinutes: (NSInteger) dMinutes;

// Date extremes
- (NSDate *) hh_dateAtStartOfDay;
- (NSDate *) hh_dateAtEndOfDay;

// Retrieving intervals
- (NSInteger) hh_minutesAfterDate: (NSDate *) aDate;
- (NSInteger) hh_minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) hh_hoursAfterDate: (NSDate *) aDate;
- (NSInteger) hh_hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) hh_daysAfterDate: (NSDate *) aDate;
- (NSInteger) hh_daysBeforeDate: (NSDate *) aDate;
- (NSInteger) hh_distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates
@property (nonatomic, readonly) NSInteger hh_year; ///< Year component
@property (nonatomic, readonly) NSInteger hh_month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger hh_day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hh_hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger hh_minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger hh_second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger hh_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger hh_weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger hh_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger hh_weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger hh_weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger hh_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger hh_quarter; ///< Quarter component


@end

NS_ASSUME_NONNULL_END
