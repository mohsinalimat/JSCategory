//
//  ViewController.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/7.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "ViewController.h"

//#import "NSDate+JSCategory.h"
//#import "NSString+JSCategory.h"
//#import "UIDevice+JSCategory.h"
//#import "UIColor+JSCategory.h"
//#import "UIButton+JSCategory.h"
//#import "UIView+JSCategory.h"
#import "JSCategory.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma mark 生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *ii = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    ii.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:ii];
    ii.image = [[UIImage imageNamed:@"tabbar_red_1"] js_imageByInsetEdge:UIEdgeInsetsMake(-10, -10, -10, -10)
                                                               withColor:[UIColor redColor]];
    
//    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"2"
//                                                                                  ofType:@"gif"]];
//    
//    NSData *data = UIImageJPEGRepresentation([UIImage imageNamed:@"tabbar_red_1"], 1.0f);
//    
//    NSLog(@"%@", [UIImage js_isAnimatedGIFData:data] ? @"YES" : @"NO");
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 300, 150)];
//    imageView.backgroundColor = [UIColor yellowColor];
////
//////    imageView.image = [UIImage js_imageWithSmallGIFData:data scale:0.5f];
//    imageView.image = [UIImage js_imageWithEmoji:@"[男厕]"
//                                            size:5.0f];
////    
//    [self.view addSubview:imageView];
//
//    NSData *pdf = [self.view js_snapshotPDF];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        UIImageView *pdfImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
//        pdfImageView.backgroundColor = [UIColor yellowColor];
//        [self.view addSubview:pdfImageView];
//        pdfImageView.image = [UIImage js_imageWithPDF:pdf
//                                                 size:CGSizeMake(350, 650)];
//    });
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    view.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:view];
//    
//    NSLog(@"%f", [view js_top]);
//    NSLog(@"%f", [view js_left]);
//    NSLog(@"%f", [view js_right]);
//    NSLog(@"%f", [view js_bottom]);
//    
//    NSLog(@"%f", [view js_width]);
    
//    NSString *number = @"15";
//    char num;
    
//    [self NSDate_JSCategory];
//    NSLog(@"%@", [[NSString stringWithFormat:@"www.baidu.com/上海市/"] js_stringByURLEncode]);
//    
//    NSLog(@"%@", [NSString js_stringWithBase64EncodedString:@"5LiK5rW35biC5pmu6ZmA5Yy6"]);
//    NSLog(@"%@", [[NSString stringWithFormat:@"www.baidu.com/%%E4%%B8%%8A%%E6%%B5%%B7%%E5%%B8%%82/"] js_stringByURLDecode]);
//    NSLog(@"%@", [@"www.baidu.com/%E4%B8%8A%E6%B5%B7%E5%B8%82/" js_stringByURLDecode]);
//    NSLog(@"%@", [[NSString stringWithFormat:@"133371989"] js_matchesRegex:@"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$"
//                                                                     options:NSRegularExpressionCaseInsensitive] ? @"YES" : @"NO");
//    num = [number js_charValue];
//    NSLog(@"%@", [[UIDevice currentDevice] js_ipAddressWIFI] ? @"YES" : @"NO ");
//    NSLog(@"%llu", [[UIDevice currentDevice] js_getNetworkTrafficBytes:JSNetworkTrafficTypeALL] / 1048576);
//    
//    self.view.backgroundColor = JSColorRGBA(122.0f, 0.0f, 224.0f, 1.0f);
//    self.view.backgroundColor = JSColorHEX(#9000E3, 1.0);
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    button.backgroundColor = [UIColor yellowColor];
//    
//    [button setImage:[UIImage imageNamed:@"tabbar_red_1"] forState:UIControlStateNormal];
//    [button setTitle:@"上海" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    
//    button.frame = CGRectMake(100, 100, 100, 50);
//    
//    [self.view addSubview:button];
//    
//    [button js_setButtonImageTitleStyle:3 spacing:10.0f];
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
