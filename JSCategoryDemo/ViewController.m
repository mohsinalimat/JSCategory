//
//  ViewController.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/7.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "ViewController.h"

#import "NSDate+JSCategory.h"
#import "NSString+JSCategory.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma mark 生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self NSDate_JSCategory];
//    NSLog(@"%@", [[NSString stringWithFormat:@"www.baidu.com/上海市/"] js_stringByURLEncode]);
//    
////    NSLog(@"%@", [NSString js_stringWithBase64EncodedString:@"5LiK5rW35biC5pmu6ZmA5Yy6"]);
////    NSLog(@"%@", [[NSString stringWithFormat:@"www.baidu.com/%%E4%%B8%%8A%%E6%%B5%%B7%%E5%%B8%%82/"] js_stringByURLDecode]);
//    NSLog(@"%@", [@"www.baidu.com/%E4%B8%8A%E6%B5%B7%E5%B8%82/" js_stringByURLDecode]);
    NSLog(@"%@", [[NSString stringWithFormat:@"13337198995"] js_matchesRegex:@"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$"
                                                                     options:NSRegularExpressionCaseInsensitive] ? @"YES" : @"NO");
}

#pragma mark NSDate+JSCategory
- (void)NSDate_JSCategory
{
    NSLog(@"%ld", [[NSDate date] js_year]);
    NSLog(@"%ld", [[NSDate date] js_month]);
    NSLog(@"%ld", [[NSDate date] js_day]);
    NSLog(@"%ld", [[NSDate date] js_hour]);
    NSLog(@"%ld", [[NSDate date] js_quarter]);
    NSLog(@"%ld", [[NSDate date] js_minute]);
    NSLog(@"%ld", [[NSDate date] js_second]);
    NSLog(@"%ld", [[NSDate date] js_nanosecond]);
    NSLog(@"%ld", [[NSDate date] js_weekday]);
    NSLog(@"%ld", [[NSDate date] js_weekdayOrdinal]);
    NSLog(@"%ld", [[NSDate date] js_weekOfYear]);
    NSLog(@"%ld", [[NSDate date] js_weekOfMonth]);
    
    NSLog(@"%@", [[NSDate date] js_isLeapMonth] ? @"YES" : @"NO");
    NSLog(@"%@", [[NSDate date] js_isLeapYear] ? @"YES" : @"NO");
    NSLog(@"%@", [[NSDate dateWithTimeIntervalSinceNow:86400.0f] js_isTomorrow] ? @"YES" : @"NO");
    NSLog(@"%@", [[NSDate date] js_isToday] ? @"YES" : @"NO");
    NSLog(@"%@", [[NSDate dateWithTimeIntervalSinceNow:-43200.0f] js_isYesterday] ? @"YES" : @"NO");
    
    NSLog(@"%@", [[NSDate date] js_dateByAddingYears:1]);
    NSLog(@"%@", [[NSDate date] js_dateByAddingMonths:1]);
    NSLog(@"%@", [[NSDate date] js_dateByAddingWeeks:1]);
    NSLog(@"%@", [[NSDate date] js_dateByAddingDays:1]);
    NSLog(@"%@", [[NSDate date] js_dateByAddingHours:1]);
    NSLog(@"%@", [[NSDate date] js_dateByAddingMinutes:1]);
    NSLog(@"%@", [[NSDate date] js_dateByAddingSeconds:1]);
    
    NSLog(@"%@", [[NSDate date] js_stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]);
    NSLog(@"%@", [[NSDate date] js_stringWithFormat:@"yyyy-MM-dd HH:mm:ss"
                                           timeZone:[NSTimeZone localTimeZone]
                                             locale:[NSLocale currentLocale]]);
    NSLog(@"%@", [[NSDate date] js_stringWithISOFormat]);
    NSLog(@"%@", [NSDate js_dateWithString:@"2016-10-25"
                                    format:@"yyyy-MM-dd"]);
    NSLog(@"%@", [NSDate js_dateWithISOFormatString:@"2016-12-08T12:13:51+0800"]);
    NSLog(@"%@", [NSDate js_dateWithString:@"2016-10-25"
                                    format:@"yyyy-MM-dd"
                                  timeZone:[NSTimeZone localTimeZone]
                                    locale:[NSLocale currentLocale]]);
}

@end
