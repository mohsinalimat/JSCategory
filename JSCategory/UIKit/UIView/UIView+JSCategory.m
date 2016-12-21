//
//  UIView+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/21.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "UIView+JSCategory.h"

@implementation UIView (JSCategory)
#pragma mark 组件方法
- (UIImage *)js_snapshotImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return snap;
}

- (NSData *)js_snapshotPDF
{
    CGRect bounds = self.bounds;
    
    NSMutableData* data = [NSMutableData data];
    
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    
    CGDataConsumerRelease(consumer);
    
    if (!context)
    {
        return nil;
    }
    
    CGPDFContextBeginPage(context, NULL);
    
    CGContextTranslateCTM(context, 0, bounds.size.height);
    
    CGContextScaleCTM(context, 1.0, -1.0);
    
    [self.layer renderInContext:context];
    
    CGPDFContextEndPage(context);
    
    CGPDFContextClose(context);
    
    CGContextRelease(context);
    
    return data;
}

- (void)js_setLayerShadow:(UIColor*)color
                   offset:(CGSize)offset
                   radius:(CGFloat)radius
{
    self.layer.shadowColor = color.CGColor;
    
    self.layer.shadowOffset = offset;
    
    self.layer.shadowRadius = radius;
    
    self.layer.shadowOpacity = 1;
    
    self.layer.shouldRasterize = YES;
    
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)js_removeAllSubviews
{
    while (self.subviews.count)
    {
        [self.subviews.lastObject removeFromSuperview];
    }
}

#pragma mark 组件属性
- (UIViewController *)js_viewController
{
    for (UIView *view = self; view; view = view.superview)
    {
        UIResponder *nextResponder = [view nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}

- (CGFloat)js_left
{
    return self.frame.origin.x;
}

- (void)setJs_left:(CGFloat)x
{
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
}

- (CGFloat)js_top
{
    return self.frame.origin.y;
}

- (void)setJs_top:(CGFloat)y
{
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
}

- (CGFloat)js_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setJs_right:(CGFloat)right
{
    CGRect frame = self.frame;
    
    frame.origin.x = right - frame.size.width;
    
    self.frame = frame;
}

- (CGFloat)js_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setJs_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    
    frame.origin.y = bottom - frame.size.height;
    
    self.frame = frame;
}

- (CGFloat)js_width
{
    return self.frame.size.width;
}

- (void)setJs_width:(CGFloat)width
{
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
}

- (CGFloat)js_height
{
    return self.frame.size.height;
}

- (void)setJs_height:(CGFloat)height
{
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
}

- (CGFloat)js_centerX
{
    return self.center.x;
}

- (void)setJs_centerX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)js_centerY
{
    return self.center.y;
}

- (void)setJs_centerY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)js_origin
{
    return self.frame.origin;
}

- (void)setJs_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    
    frame.origin = origin;
    
    self.frame = frame;
}

- (CGSize)js_size
{
    return self.frame.size;
}

- (void)setJs_size:(CGSize)size
{
    CGRect frame = self.frame;
    
    frame.size = size;
    
    self.frame = frame;
}

@end
