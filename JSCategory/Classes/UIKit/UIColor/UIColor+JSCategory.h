//
//  UIColor+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern void JS_RGB2HSL(CGFloat r, CGFloat g, CGFloat b,
                       CGFloat *h, CGFloat *s, CGFloat *l);

extern void JS_HSL2RGB(CGFloat h, CGFloat s, CGFloat l,
                       CGFloat *r, CGFloat *g, CGFloat *b);

extern void JS_RGB2HSB(CGFloat r, CGFloat g, CGFloat b,
                       CGFloat *h, CGFloat *s, CGFloat *v);

extern void JS_HSB2RGB(CGFloat h, CGFloat s, CGFloat v,
                       CGFloat *r, CGFloat *g, CGFloat *b);

extern void JS_RGB2CMYK(CGFloat r, CGFloat g, CGFloat b,
                        CGFloat *c, CGFloat *m, CGFloat *y, CGFloat *k);

extern void JS_CMYK2RGB(CGFloat c, CGFloat m, CGFloat y, CGFloat k,
                        CGFloat *r, CGFloat *g, CGFloat *b);

extern void JS_HSB2HSL(CGFloat h, CGFloat s, CGFloat b,
                       CGFloat *hh, CGFloat *ss, CGFloat *ll);

extern void JS_HSL2HSB(CGFloat h, CGFloat s, CGFloat l,
                       CGFloat *hh, CGFloat *ss, CGFloat *bb);

@interface UIColor (JSCategory)
#pragma mark UIColor
/**
 获取相应的 HSL 和 Alpha 组成的颜色对象

 @param hue        色相: 数值范围 0.0 到 1.0
 @param saturation 饱和度: 数值范围 0.0 到 1.0
 @param lightness  明度: 数值范围 0.0 到 1.0
 @param alpha      颜色的透明通道: 数值范围 0.0 到 1.0
 */
+ (UIColor *)js_colorWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                   lightness:(CGFloat)lightness
                       alpha:(CGFloat)alpha;

/**
 获取相应的 CMYK 和 Alpha 组成的颜色对象

 @param cyan    青色: 数值范围 0.0 到 1.0
 @param magenta 品红色: 数值范围 0.0 到 1.0
 @param yellow  黄色: 数值范围 0.0 到 1.0
 @param black   定位套版色 (黑色): 数值范围 0.0 到 1.0
 @param alpha   颜色的透明通道: 数值范围 0.0 到 1.0
 */
+ (UIColor *)js_colorWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                        black:(CGFloat)black
                        alpha:(CGFloat)alpha;

/**
 获取相应的 RGB (Hex) 组成的颜色对象
 
 @param rgbValue  RGB: 例如: 0x66ccff
 */
+ (UIColor *)js_colorWithRGB:(uint32_t)rgbValue;

/**
 获取相应的 RGBA (Hex) 组成的颜色对象
 
 @param rgbaValue  RGB: 例如: 0x66ccffff
 */
+ (UIColor *)js_colorWithRGBA:(uint32_t)rgbaValue;

/**
 获取相应的 RGB (Hex) 和 Alpha 组成的颜色对象
 
 @param rgbValue RGB: 例如: 0x66ccff
 @param alpha    颜色的透明通道: 数值范围 0.0 到 1.0
 */
+ (UIColor *)js_colorWithRGB:(uint32_t)rgbValue
                       alpha:(CGFloat)alpha;

/**
 获取相应的 HEX 组成的颜色对象
 
 @param hexString HEX: 例如: @"0xF0F", @"66ccff", @"#66CCFF88"
 */
+ (nullable UIColor *)js_colorWithHexString:(NSString *)hexString;

#pragma mark 颜色描述
/**
 返回颜色的 RGB 数值 (HEX): 例如: 0x66ccff
 */
- (uint32_t)js_rgbValue;

/**
 返回颜色的 RGBA 数值 (HEX): 例如: 0x66ccffff
 */
- (uint32_t)js_rgbaValue;

/**
 返回颜色的 RGB 数值 (HEX) (小写字母): 例如: @"0066cc"
 
 @warning 如果颜色空间不是 RGB 将会返回 nil
 */
- (nullable NSString *)js_hexString;

/**
 返回颜色的 RGBA 数值 (HEX) (小写字母): 例如: @"0066ccff"
 
 @warning 如果颜色空间不是 RGB 将会返回 nil
 */
- (nullable NSString *)js_hexStringWithAlpha;

#pragma mark 检索颜色信息
/**
 RGB 颜色的 Red 数值: 数值范围 0.0 到 1.0
 */
@property (nonatomic, readonly) CGFloat js_red;

/**
 RGB 颜色的 Green 数值: 数值范围 0.0 到 1.0
 */
@property (nonatomic, readonly) CGFloat js_green;

/**
 RGB 颜色的 Blue 数值: 数值范围 0.0 到 1.0
 */
@property (nonatomic, readonly) CGFloat js_blue;

/**
 HSB 颜色的 Hue (色相) 数值: 数值范围 0.0 到 1.0
 */
@property (nonatomic, readonly) CGFloat js_hue;

/**
 HSB 颜色的 Saturation (饱和度) 数值: 数值范围 0.0 到 1.0
 */
@property (nonatomic, readonly) CGFloat js_saturation;

/**
 HSB 颜色的 Brightness (亮度) 数值: 数值范围 0.0 到 1.0
 */
@property (nonatomic, readonly) CGFloat js_brightness;

/**
 颜色的 Alpha (透明通道) 数值: 数值范围 0.0 到 1.0
 */
@property (nonatomic, readonly) CGFloat js_alpha;

/**
 颜色的色彩模式
 */
@property (nonatomic, readonly) CGColorSpaceModel js_colorSpaceModel;

/**
 颜色的色彩模式
 */
@property (nullable, nonatomic, readonly) NSString *js_colorSpaceString;

@end

NS_ASSUME_NONNULL_END
