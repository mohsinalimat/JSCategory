//
//  NSDate+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/7.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JSCategory)
#pragma mark 组件属性
/**
 年单位
 */
@property (nonatomic, readonly) NSInteger year;

/**
 月单位：范围为1~12
 */
@property (nonatomic, readonly) NSInteger month;

/**
 天单位：范围为1~31
 */
@property (nonatomic, readonly) NSInteger day;

/**
 小时单位：范围为0~24
 */
@property (nonatomic, readonly) NSInteger hour;

/**
 分钟单位：范围为0~60
 */
@property (nonatomic, readonly) NSInteger minute;

/**
 秒单位：范围为0~60
 */
@property (nonatomic, readonly) NSInteger second;

/**
 纳秒：十亿分之一秒
 */
@property (nonatomic, readonly) NSInteger nanosecond;

/**
 星期单位：范围为1~7，系统默认星期日是第一天
 */
@property (nonatomic, readonly) NSInteger weekday;

/**
 以7天为单位：范围为1~5 （1-7号为第1个7天，8-14号为第2个7天...）
 */
@property (nonatomic, readonly) NSInteger weekdayOrdinal;

/**
 月包含的周数：范围为1~5
 */
@property (nonatomic, readonly) NSInteger weekOfMonth;

/**
 年包含的周数：范围为1~53
 */
@property (nonatomic, readonly) NSInteger weekOfYear;

/**
 刻钟单位：范围为1~4
 */
@property (nonatomic, readonly) NSInteger quarter;

/**
 是否为闰月
 */
@property (nonatomic, readonly) BOOL isLeapMonth;

/**
 是否为闰年
 */
@property (nonatomic, readonly) BOOL isLeapYear;

/**
 是否为今日
 */
@property (nonatomic, readonly) BOOL isToday;

/**
 是否为昨日
 */
@property (nonatomic, readonly) BOOL isYesterday;

/**
 是否为明天
 */
@property (nonatomic ,readonly) BOOL isTomorrow;

#pragma mark NSDate修饰
/**
 获得若干年后的时间
 */
- (nullable NSDate *)dateByAddingYears:(NSInteger)years;

/**
 获得若干月后的时间
 */
- (nullable NSDate *)dateByAddingMonths:(NSInteger)months;

/**
 获得若干周后的时间
 */
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks;

/**
 获得若干天后的时间
 */
- (nullable NSDate *)dateByAddingDays:(NSInteger)days;

/**
 获得若干小时后的时间
 */
- (nullable NSDate *)dateByAddingHours:(NSInteger)hours;

/**
 获得若干分钟后的时间
 */
- (nullable NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/**
 获得若干秒后的时间
 */
- (nullable NSDate *)dateByAddingSeconds:(NSInteger)seconds;

#pragma mark NSDate格式化
/**
 获取相应格式的字符串：@"yyyy-MM-dd HH:mm:ss"
 */
- (nullable NSString *)stringWithFormat:(nullable NSString *)format;

/**
 获取相应格式的字符串：格式化字符串、时区信息、语言信息
 
 @param format   格式化字符串：@"yyyy-MM-dd HH:mm:ss"
 @param timeZone 时区信息
 @param locale   语言信息
 
 @return 返回相应格式的字符串
 */
- (nullable NSString *)stringWithFormat:(nullable NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;

/**
 获取ISO8601格式的字符串：@"2016-12-08T12:13:51+0800"
 */
- (nullable NSString *)stringWithISOFormat;

/**
 获取给定字符串依据ISO8601格式解析得到的日期
 */
+ (nullable NSDate *)dateWithISOFormatString:(nullable NSString *)dateString;

/**
 获取给定字符串依据给定格式解析得到的日期
 */
+ (nullable NSDate *)dateWithString:(nullable NSString *)dateString
                             format:(nullable NSString *)format;

/**
 获取给定字符串依据给定格式解析得到的日期：时区信息、语言信息
 
 @param timeZone 时区信息
 @param locale   语言信息
 */
+ (nullable NSDate *)dateWithString:(nullable NSString *)dateString
                             format:(nullable NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;

@end
