//
//  UITextView+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 2017/3/16.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (JSCategory)
/**
 placeholder
 */
- (void)js_setupPlaceholderLabelWithPlaceholder:(NSString *)placeholder
                                           font:(CGFloat)font
                                          color:(UIColor *)color;

/**
 limit length
 */
- (void)js_setupLimitLengthLabelWithLimitLength:(NSNumber *)limitLength
                                           font:(CGFloat)font
                                          color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
