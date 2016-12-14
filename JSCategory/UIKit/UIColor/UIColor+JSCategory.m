//
//  UIColor+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "UIColor+JSCategory.h"

#import "NSString+JSCategory.h"

@implementation UIColor (JSCategory)
#pragma mark UIColor
+ (UIColor *)js_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
{
    // 删除字符串中的空格
    NSString *colorString = [[hexString js_stringByTrim] uppercaseString];
    
    if ([colorString length] < 6)
    {
        return [UIColor clearColor];
    }
    
    // 如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([colorString hasPrefix:@"0X"])
    {
        colorString = [colorString substringFromIndex:2];
    }
    
    // 如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([colorString hasPrefix:@"#"])
    {
        colorString = [colorString substringFromIndex:1];
    }
    
    // 除去所有开头字符后 再判断字符串长度
    if ([colorString length] != 6)
    {
        return [UIColor clearColor];
    }

    NSRange range;
    
    range.length = 2;
    
    //Red
    range.location = 0;
    NSString * redString = [colorString substringWithRange:range];
    
    //Green
    range.location = 2;
    NSString * greenString = [colorString substringWithRange:range];
    
    //Blue
    range.location = 4;
    NSString * blueString = [colorString substringWithRange:range];
    
    //将十六进制转换成二进制
    unsigned int red, green, blue;
    
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];

    return JSColorRGBA(red, green, blue, alpha);
}

@end
