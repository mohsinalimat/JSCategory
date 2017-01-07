//
//  UIView+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/21.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JSCategory)
#pragma mark 组件方法
/**
 全屏幕抓拍
 */
- (nullable UIImage *)js_snapshotImage;

/**
 全屏幕抓拍 - PDF
 */
- (nullable NSData *)js_snapshotPDF;

/**
 设置图层阴影
 
 @param color  阴影颜色
 @param offset 阴影偏移量
 @param radius 阴影半径
 */
- (void)js_setLayerShadow:(nullable UIColor*)color
                   offset:(CGSize)offset
                   radius:(CGFloat)radius;

/**
 移除所有的子视图
 
 @warning 禁止在你的 view's 的 "drawRect:" 方法中调用该函数
 */
- (void)js_removeAllSubviews;

#pragma mark 组件属性
/**
 获取该视图的控制器 (可能为nil)
 */
@property (nullable, nonatomic, readonly) UIViewController *js_viewController;

@property (nonatomic) CGFloat js_left;        ///< 快捷获取 frame.origin.x.
@property (nonatomic) CGFloat js_top;         ///< 快捷获取 frame.origin.y
@property (nonatomic) CGFloat js_right;       ///< 快捷获取 frame.origin.x + frame.size.width
@property (nonatomic) CGFloat js_bottom;      ///< 快捷获取 frame.origin.y + frame.size.height
@property (nonatomic) CGFloat js_width;       ///< 快捷获取 frame.size.width.
@property (nonatomic) CGFloat js_height;      ///< 快捷获取 frame.size.height.
@property (nonatomic) CGFloat js_centerX;     ///< 快捷获取 center.x
@property (nonatomic) CGFloat js_centerY;     ///< 快捷获取 center.y
@property (nonatomic) CGPoint js_origin;      ///< 快捷获取 frame.origin.
@property (nonatomic) CGSize  js_size;        ///< 快捷获取 frame.size.

@end

NS_ASSUME_NONNULL_END
