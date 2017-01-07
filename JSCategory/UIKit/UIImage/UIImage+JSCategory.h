//
//  UIImage+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/21.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JSCategory)
#pragma mark 创建图片
/**
 通过 GIF 的二进制文件创建动画图片. 创建之后, 可以通过属性 '.image' 加载.
 如果该二进制文件不是可动的 GIF, 该方法等同于 '[UIImage imageWithData:data scale:scale]'
 
 @discussion  该方法加载性能良好, 但是会占用较多的内存空间 (width * height * frames 字节).
 仅适用于加载较小的 GIF 图片, 例如: 可动的 Emoji.

 @param data   GIF 的二进制数据
 @param scale  缩放比例
 */
+ (nullable UIImage *)js_imageWithSmallGIFData:(NSData *)data
                                         scale:(CGFloat)scale;

/**
 该二进制文件是否为可动的 GIF 文件.
 */
+ (BOOL)js_isAnimatedGIFData:(NSData *)data;

/**
 指定文件路径的文件是否为 GIF.
 */
+ (BOOL)js_isAnimatedGIFFile:(NSString *)path;

/**
 通过 PDF 文件数据或路径创建图片
 
 @discussion  如果该 PDF 文件包含多页, 仅返回第一页的内容.
 Image's 比例与当前屏幕比例相同, 尺寸与 PDF's 原尺寸相同
 
 @param dataOrPath PDF 数据: 'NSData' 或 PDF 文件路径: 'NSString'
 
 @warning 当发生错误时, 返回 nil
 */
+ (nullable UIImage *)js_imageWithPDF:(id)dataOrPath;

/**
 通过 PDF 文件数据或路径创建图片
 
 @discussion  如果该 PDF 文件包含多页, 仅返回第一页的内容.
 Image's 比例与当前屏幕比例相同
 
 @param dataOrPath PDF 数据: 'NSData' 或 PDF 文件路径: 'NSString'
 @param size 新图片的尺寸, PDF 格式的内容会进行拉伸
 
 @warning 当发生错误时, 返回 nil
 */
+ (nullable UIImage *)js_imageWithPDF:(id)dataOrPath
                                 size:(CGSize)size;

/**
 创建 Emoji 表情图片
 */
+ (nullable UIImage *)js_imageWithEmoji:(NSString *)emoji
                                   size:(CGFloat)size;

/**
 通过颜色创建一个 1x1 的图片
 */
+ (nullable UIImage *)js_imageWithColor:(UIColor *)color;

/**
 通过颜色创建指定大小的图片
 */
+ (nullable UIImage *)js_imageWithColor:(UIColor *)color
                                   size:(CGSize)size;

/**
 通过自定义绘制代码创建并返回一个图像
 */
+ (nullable UIImage *)js_imageWithSize:(CGSize)size
                             drawBlock:(void (^)(CGContextRef context))drawBlock;

#pragma mark 图片信息
/**
 图片是否包含alpha通道
 */
- (BOOL)js_hasAlphaChannel;

#pragma mark 图片处理
/**
 在指定尺寸的矩形内绘制图像内容, 图像内容将依据 contentMode 改变
 */
- (void)js_drawInRect:(CGRect)rect
      withContentMode:(UIViewContentMode)contentMode
        clipsToBounds:(BOOL)clips;

/**
 获取一张经过缩放的图片
 图片可能会被拉伸
 */
- (nullable UIImage *)js_imageByResizeToSize:(CGSize)size;

/**
 获取一张经过缩放的图片 - 改变了图片的展示模式
 */
- (nullable UIImage *)js_imageByResizeToSize:(CGSize)size
                                 contentMode:(UIViewContentMode)contentMode;

/**
 获取一张经过裁剪的图片
 */
- (nullable UIImage *)js_imageByCropToRect:(CGRect)rect;

/**
 获取一张经过边缘插入后的图片
 
 @param insets  边缘插入 (正数), 数值可以为负数
 @param color   边缘插入填充颜色, nil 表示颜色为透明色
 */
- (nullable UIImage *)js_imageByInsetEdge:(UIEdgeInsets)insets
                                withColor:(nullable UIColor *)color;

/**
 获取一张经过裁剪圆角的图片
 
 @param radius  圆角半径
 */
- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius;

/**
 获取一张经过裁剪圆角的图片, 边缘插图宽度, 边缘插图颜色
 
 @param radius       圆角半径
 @param borderWidth  边缘插图边界线宽度
 @param borderColor  边缘插入颜色
 */
- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor;

/**
 获取一张经过裁剪圆角的图片, 边角 (左上, 右上, 左下, 右下), 边缘插图宽度, 边缘插图颜色, 接合类型
 
 @param radius         圆角半径
 @param corners        边角 (左上, 右上, 左下, 右下)
 @param borderWidth    边缘插图边界线宽度
 @param borderColor    边缘插入颜色
 @param borderLineJoin 连线接合类型
 */
- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius
                                          corners:(UIRectCorner)corners
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor
                                   borderLineJoin:(CGLineJoin)borderLineJoin;

/**
 获取旋转后的图像 (相对于中心点)
 
 @param radians   逆时针旋转弧度 ⟲
 @param fitSize   YES: 新图片的尺寸将会改变以适应旋转
                  NO: 新图片的尺寸不会改变
 */
- (nullable UIImage *)js_imageByRotate:(CGFloat)radians
                               fitSize:(BOOL)fitSize;

/**
 获取逆时针旋转 90° 后的图像 ⤺
 图像的宽高将互换
 */
- (nullable UIImage *)js_imageByRotateLeft90;

/**
 获取顺时针旋转 90° 后的图像 ⤼
 图像的宽高将互换
 */
- (nullable UIImage *)js_imageByRotateRight90;

/**
 获取旋转 180° 后的图像 ↻
 */
- (nullable UIImage *)js_imageByRotate180;

/**
 获取垂直翻转后的图像 ⥯
 */
- (nullable UIImage *)js_imageByFlipVertical;

/**
 获取水平翻转后的图像 ⇋
 */
- (nullable UIImage *)js_imageByFlipHorizontal;


#pragma mark 图片效果
/**
 Tint Color
 */
- (nullable UIImage *)js_imageByTintColor:(UIColor *)color;

/**
 获取一个灰度图像
 */
- (nullable UIImage *)js_imageByGrayscale;

/**
 获取图像的模糊效果, 适用于模糊任何内容
 */
- (nullable UIImage *)js_imageByBlurSoft;

/**
 获取图像的模糊效果, 适用于模糊除纯白色以外的任何内容 (效果类似 iOS Control Panel)
 */
- (nullable UIImage *)js_imageByBlurLight;

/**
 获取图像的模糊效果, 适用于显示黑色文本 (效果类似 iOS Navigation Bar White)
 */
- (nullable UIImage *)js_imageByBlurExtraLight;

/**
 获取图像的模糊效果, 适用于显示白色文本 (效果类似 iOS Notification Center)
 */
- (nullable UIImage *)js_imageByBlurDark;

/**
 获取图像的 Tint Color 模糊效果
 */
- (nullable UIImage *)js_imageByBlurWithTint:(UIColor *)tintColor;

/**
 Applies a blur, tint color, and saturation adjustment to this image,
 optionally within the area specified by @a maskImage.
 
 @param blurRadius     The radius of the blur in points, 0 means no blur effect.
 
 @param tintColor      An optional UIColor object that is uniformly blended with
 the result of the blur and saturation operations. The
 alpha channel of this color determines how strong the
 tint is. nil means no tint.
 
 @param tintBlendMode  The @a tintColor blend mode. Default is kCGBlendModeNormal (0).
 
 @param saturation     A value of 1.0 produces no change in the resulting image.
 Values less than 1.0 will desaturation the resulting image
 while values greater than 1.0 will have the opposite effect.
 0 means gray scale.
 
 @param maskImage      If specified, @a inputImage is only modified in the area(s)
 defined by this mask.  This must be an image mask or it
 must meet the requirements of the mask parameter of
 CGContextClipToMask.
 
 @return               image with effect, or nil if an error occurs (e.g. no
 enough memory).
 */
- (nullable UIImage *)js_imageByBlurRadius:(CGFloat)blurRadius
                                 tintColor:(nullable UIColor *)tintColor
                                  tintMode:(CGBlendMode)tintBlendMode
                                saturation:(CGFloat)saturation
                                 maskImage:(nullable UIImage *)maskImage;

@end

NS_ASSUME_NONNULL_END
