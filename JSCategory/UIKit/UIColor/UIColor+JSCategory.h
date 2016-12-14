//
//  UIColor+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef JSColorHEX
#define JSColorHEX(_hex_, _a_)   [UIColor js_colorWithHexString:((__bridge NSString *)CFSTR(#_hex_)) alpha:(_a_)]
#endif

#ifndef JSColorRGBA
#define JSColorRGBA(_r_, _g_, _b_, _a_) [UIColor colorWithRed:((_r_) / 255.0f) green:((_g_) / 255.0f) blue:((_b_) / 255.0f) alpha:(_a_)]
#endif

@interface UIColor (JSCategory)
#pragma mark UIColor
/**
 获取相应的十六进制字符串对应的颜色
 */
+ (UIColor *)js_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
@end
