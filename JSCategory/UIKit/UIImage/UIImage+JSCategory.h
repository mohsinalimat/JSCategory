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
 通过GIF的二进制文件创建动画图片. 创建之后, 可以通过属性 '.image' 加载. 
 如果该二进制文件不是可动的GIF, 该方法等同于 '[UIImage imageWithData:data scale:scale]'
 
 @discussion  该方法加载性能良好, 但是会占用较多的内存空间 (width * height * frames 字节).
 仅适用于加载较小的GIF图片, 例如: 可动的Emoji.

 @param data   GIF的二进制数据
 @param scale  缩放比例
 */
+ (UIImage *)js_imageWithSmallGIFData:(NSData *)data
                                scale:(CGFloat)scale;

/**
 该二进制文件是否为可动的GIF文件.
 */
+ (BOOL)js_isAnimatedGIFData:(NSData *)data;

/**
 指定文件路径的文件是否为GIF.
 */
+ (BOOL)js_isAnimatedGIFFile:(NSString *)path;

/**
 通过PDF文件数据或路径创建图片
 
 @discussion  如果该PDF文件包含多页, 仅返回第一页的内容.
 Image's 缩放比例为默认缩放比例, 大小与PDF文件大小相同
 */
+ (UIImage *)js_imageWithPDF:(id)dataOrPath;

/**
 通过PDF文件数据或路径创建图片
 
 @discussion  如果该PDF文件包含多页, 仅返回第一页的内容.
 Image's 缩放比例为默认缩放比例, 大小与PDF文件大小相同
 */
+ (UIImage *)js_imageWithPDF:(id)dataOrPath
                        size:(CGSize)size;

///**
// 创建Emoji表情图片
// */
//+ (UIImage *)js_imageWithEmoji:(NSString *)emoji
//                          size:(CGFloat)size;

/**
 通过颜色创建一个1x1的图片
 */
+ (UIImage *)js_imageWithColor:(UIColor *)color;

/**
 通过颜色创建指定大小的图片
 */
+ (UIImage *)js_imageWithColor:(UIColor *)color
                          size:(CGSize)size;

#pragma mark 图片信息
/**
 图片是否包含alpha通道
 */
- (BOOL)js_hasAlphaChannel;

#pragma mark 图片处理
///=============================================================================
/// @name Modify Image
///=============================================================================

/**
 Draws the entire image in the specified rectangle, content changed with
 the contentMode.
 
 @discussion This method draws the entire image in the current graphics context,
 respecting the image's orientation setting. In the default coordinate system,
 images are situated down and to the right of the origin of the specified
 rectangle. This method respects any transforms applied to the current graphics
 context, however.
 
 @param rect        The rectangle in which to draw the image.
 
 @param contentMode Draw content mode
 
 @param clips       A Boolean value that determines whether content are confined to the rect.
 */
- (void)js_drawInRect:(CGRect)rect
      withContentMode:(UIViewContentMode)contentMode
        clipsToBounds:(BOOL)clips;

/**
 获取一张经过缩放的图片.
 图片可能会拉伸
 */
- (UIImage *)js_imageByResizeToSize:(CGSize)size;

/**
 获取一张经过缩放的图片. - 图片的展示模式
 */
- (UIImage *)js_imageByResizeToSize:(CGSize)size
                        contentMode:(UIViewContentMode)contentMode;

/**
 获取一张经过裁剪的图片
 */
- (UIImage *)js_imageByCropToRect:(CGRect)rect;

/**
 Returns a new image which is edge inset from this image.
 
 
 
 @param insets  Inset (positive) for each of the edges, values can be negative to 'outset'.
 
 @param color   Extend edge's fill color, nil means clear color.
 
 @return        The new image, or nil if an error occurs.
 */
- (UIImage *)js_imageByInsetEdge:(UIEdgeInsets)insets
                       withColor:(UIColor *)color;

/**
 Rounds a new image with a given corner size.
 
 @param radius  The radius of each corner oval. Values larger than half the
 rectangle's width or height are clamped appropriately to half
 the width or height.
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

/**
 Rounds a new image with a given corner size.
 
 @param radius       The radius of each corner oval. Values larger than half the
 rectangle's width or height are clamped appropriately to
 half the width or height.
 
 @param borderWidth  The inset border line width. Values larger than half the rectangle's
 width or height are clamped appropriately to half the width
 or height.
 
 @param borderColor  The border stroke color. nil means clear color.
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;

/**
 Rounds a new image with a given corner size.
 
 @param radius       The radius of each corner oval. Values larger than half the
 rectangle's width or height are clamped appropriately to
 half the width or height.
 
 @param corners      A bitmask value that identifies the corners that you want
 rounded. You can use this parameter to round only a subset
 of the corners of the rectangle.
 
 @param borderWidth  The inset border line width. Values larger than half the rectangle's
 width or height are clamped appropriately to half the width
 or height.
 
 @param borderColor  The border stroke color. nil means clear color.
 
 @param borderLineJoin The border line join.
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/**
 Returns a new rotated image (relative to the center).
 
 @param radians   Rotated radians in counterclockwise.⟲
 
 @param fitSize   YES: new image's size is extend to fit all content.
 NO: image's size will not change, content may be clipped.
 */
- (nullable UIImage *)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;

/**
 Returns a new image rotated counterclockwise by a quarter‑turn (90°). ⤺
 The width and height will be exchanged.
 */
- (nullable UIImage *)imageByRotateLeft90;

/**
 Returns a new image rotated clockwise by a quarter‑turn (90°). ⤼
 The width and height will be exchanged.
 */
- (nullable UIImage *)imageByRotateRight90;

/**
 Returns a new image rotated 180° . ↻
 */
- (nullable UIImage *)imageByRotate180;

/**
 Returns a vertically flipped image. ⥯
 */
- (nullable UIImage *)imageByFlipVertical;

/**
 Returns a horizontally flipped image. ⇋
 */
- (nullable UIImage *)imageByFlipHorizontal;


#pragma mark - Image Effect
///=============================================================================
/// @name Image Effect
///=============================================================================

/**
 Tint the image in alpha channel with the given color.
 
 @param color  The color.
 */
- (nullable UIImage *)imageByTintColor:(UIColor *)color;

/**
 Returns a grayscaled image.
 */
- (nullable UIImage *)imageByGrayscale;

/**
 Applies a blur effect to this image. Suitable for blur any content.
 */
- (nullable UIImage *)imageByBlurSoft;

/**
 Applies a blur effect to this image. Suitable for blur any content except pure white.
 (same as iOS Control Panel)
 */
- (nullable UIImage *)imageByBlurLight;

/**
 Applies a blur effect to this image. Suitable for displaying black text.
 (same as iOS Navigation Bar White)
 */
- (nullable UIImage *)imageByBlurExtraLight;

/**
 Applies a blur effect to this image. Suitable for displaying white text.
 (same as iOS Notification Center)
 */
- (nullable UIImage *)imageByBlurDark;

/**
 Applies a blur and tint color to this image.
 
 @param tintColor  The tint color.
 */
- (nullable UIImage *)imageByBlurWithTint:(UIColor *)tintColor;

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
- (nullable UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                              tintColor:(nullable UIColor *)tintColor
                               tintMode:(CGBlendMode)tintBlendMode
                             saturation:(CGFloat)saturation
                              maskImage:(nullable UIImage *)maskImage;

@end

NS_ASSUME_NONNULL_END
