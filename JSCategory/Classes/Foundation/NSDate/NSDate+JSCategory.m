//
//  NSDate+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/12.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "NSDate+JSCategory.h"

@implementation NSDate (JSCategory)
#pragma mark 组件属性
- (NSInteger)js_year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                            fromDate:self] year];
}

- (NSInteger)js_month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth
                                            fromDate:self] month];
}

- (NSInteger)js_day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                            fromDate:self] day];
}

- (NSInteger)js_hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour
                                            fromDate:self] hour];
}

- (NSInteger)js_quarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter
                                            fromDate:self] quarter];
}

- (NSInteger)js_minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute
                                            fromDate:self] minute];
}

- (NSInteger)js_second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond
                                            fromDate:self] second];
}

- (NSInteger)js_nanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond
                                            fromDate:self] nanosecond];
}

- (NSInteger)js_weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday
                                            fromDate:self] weekday];
}

- (NSInteger)js_weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal
                                            fromDate:self] weekdayOrdinal];
}

- (NSInteger)js_weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth
                                            fromDate:self] weekOfMonth];
}

- (NSInteger)js_weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear
                                            fromDate:self] weekOfYear];
}

- (BOOL)js_isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter
                                            fromDate:self] isLeapMonth];
}

- (BOOL)js_isLeapYear {
    NSUInteger year = self.js_year;
    
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)js_isYesterday {
    NSDate *added = [self js_dateByAddingDays:1];
    
    return [added js_isToday];
}

- (BOOL)js_isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) {
        return NO;
    }
    
    return [NSDate new].js_day == self.js_day;
}

- (BOOL)js_isTomorrow {
    NSDate *added = [self js_dateByAddingDays:-1];
    
    return [added js_isToday];
}

#pragma mark NSDate修饰
- (NSDate *)js_dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setYear:years];
    
    return [calendar dateByAddingComponents:components
                                     toDate:self
                                    options:0];
}

- (NSDate *)js_dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setMonth:months];
    
    return [calendar dateByAddingComponents:components
                                     toDate:self
                                    options:0];
}

- (NSDate *)js_dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setWeekOfYear:weeks];
    
    return [calendar dateByAddingComponents:components
                                     toDate:self
                                    options:0];
}

- (NSDate *)js_dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
    return newDate;
}

- (NSDate *)js_dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
    return newDate;
}

- (NSDate *)js_dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
    return newDate;
}

- (NSDate *)js_dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
    return newDate;
}

#pragma mark NSDate格式化
- (NSString *)js_stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:format];
    
    [formatter setLocale:[NSLocale currentLocale]];
    
    return [formatter stringFromDate:self];
}

- (NSString *)js_stringWithFormat:(NSString *)format
                         timeZone:(NSTimeZone *)timeZone
                           locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:format];
    
    if (timeZone) {
        [formatter setTimeZone:timeZone];
    }
    
    if (locale) {
        [formatter setLocale:locale];
    }
    
    return [formatter stringFromDate:self];
}

- (NSString *)js_stringWithISOFormat {
    static NSDateFormatter *formatter = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    });
    
    return [formatter stringFromDate:self];
}

+ (NSDate *)js_dateWithISOFormatString:(NSString *)dateString {
    static NSDateFormatter *formatter = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    });
    
    return [formatter dateFromString:dateString];
}

+ (NSDate *)js_dateWithString:(NSString *)dateString
                       format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:format];
    
    return [formatter dateFromString:dateString];
}

+ (NSDate *)js_dateWithString:(NSString *)dateString
                       format:(NSString *)format
                     timeZone:(NSTimeZone *)timeZone
                       locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:format];
    
    if (timeZone) {
        [formatter setTimeZone:timeZone];
    }
    
    if (locale) {
        [formatter setLocale:locale];
    }
    
    return [formatter dateFromString:dateString];
}

@end
