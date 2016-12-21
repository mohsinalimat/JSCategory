//
//  NSDate+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/12.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (JSCategory)
#pragma mark 组件属性
/**
 年单位
 */
@property (nonatomic, readonly) NSInteger js_year;

/**
 月单位：范围为1~12
 */
@property (nonatomic, readonly) NSInteger js_month;

/**
 天单位：范围为1~31
 */
@property (nonatomic, readonly) NSInteger js_day;

/**
 小时单位：范围为0~24
 */
@property (nonatomic, readonly) NSInteger js_hour;

/**
 刻钟单位：范围为1~4
 */
@property (nonatomic, readonly) NSInteger js_quarter;

/**
 分钟单位：范围为0~60
 */
@property (nonatomic, readonly) NSInteger js_minute;

/**
 秒单位：范围为0~60
 */
@property (nonatomic, readonly) NSInteger js_second;

/**
 纳秒：十亿分之一秒
 */
@property (nonatomic, readonly) NSInteger js_nanosecond;

/**
 星期单位：范围为1~7，系统默认星期日是第一天
 */
@property (nonatomic, readonly) NSInteger js_weekday;

/**
 以7天为单位：范围为1~5（1-7号为第1个7天，8-14号为第2个7天...）
 */
@property (nonatomic, readonly) NSInteger js_weekdayOrdinal;

/**
 日期所在为当月第几周：范围为1~5
 */
@property (nonatomic, readonly) NSInteger js_weekOfMonth;

/**
 日期所在为当年第几周：范围为1~53
 */
@property (nonatomic, readonly) NSInteger js_weekOfYear;

/**
 是否为闰月
 */
@property (nonatomic, readonly) BOOL js_isLeapMonth;

/**
 是否为闰年
 */
@property (nonatomic, readonly) BOOL js_isLeapYear;

/**
 是否为昨日
 */
@property (nonatomic, readonly) BOOL js_isYesterday;

/**
 是否为今日
 */
@property (nonatomic, readonly) BOOL js_isToday;

/**
 是否为明日
 */
@property (nonatomic, readonly) BOOL js_isTomorrow;

#pragma mark NSDate修饰
/**
 获得若干年后的时间
 */
- (NSDate *)js_dateByAddingYears:(NSInteger)years;

/**
 获得若干月后的时间
 */
- (NSDate *)js_dateByAddingMonths:(NSInteger)months;

/**
 获得若干周后的时间
 */
- (NSDate *)js_dateByAddingWeeks:(NSInteger)weeks;

/**
 获得若干天后的时间
 */
- (NSDate *)js_dateByAddingDays:(NSInteger)days;

/**
 获得若干小时后的时间
 */
- (NSDate *)js_dateByAddingHours:(NSInteger)hours;

/**
 获得若干分钟后的时间
 */
- (NSDate *)js_dateByAddingMinutes:(NSInteger)minutes;

/**
 获得若干秒后的时间
 */
- (NSDate *)js_dateByAddingSeconds:(NSInteger)seconds;

#pragma mark NSDate格式化
/**
 获取相应格式的字符串：@"yyyy-MM-dd HH:mm:ss"
 */
- (NSString *)js_stringWithFormat:(NSString *)format;

/**
 获取相应格式的字符串：格式化字符串、时区信息、语言信息
 
 @param format   格式化字符串：@"yyyy-MM-dd HH:mm:ss"
 @param timeZone 时区信息
 @param locale   语言信息
 
 @return 返回相应格式的字符串
 */
- (NSString *)js_stringWithFormat:(NSString *)format
                         timeZone:(NSTimeZone *)timeZone
                           locale:(NSLocale *)locale;

/**
 获取ISO8601格式的字符串：@"2016-12-08T12:13:51+0800"
 */
- (NSString *)js_stringWithISOFormat;

/**
 获取给定字符串依据ISO8601格式解析得到的日期
 */
+ (NSDate *)js_dateWithISOFormatString:(NSString *)dateString;

/**
 获取给定字符串依据给定格式解析得到的日期
 */
+ (NSDate *)js_dateWithString:(NSString *)dateString
                       format:(NSString *)format;

/**
 获取给定字符串依据给定格式解析得到的日期：时区信息、语言信息
 
 @param timeZone 时区信息
 @param locale   语言信息
 */
+ (NSDate *)js_dateWithString:(NSString *)dateString
                       format:(NSString *)format
                     timeZone:(NSTimeZone *)timeZone
                       locale:(NSLocale *)locale;

@end

NS_ASSUME_NONNULL_END
