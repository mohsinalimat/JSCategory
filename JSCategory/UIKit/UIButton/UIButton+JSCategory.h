//
//  UIButton+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, JSButtonImageTitleStyle)
{
    JSButtonImageTitleStyleLeft   = 0,  //图片在左，文字在右，整体居中。
    JSButtonImageTitleStyleRight  = 1,  //图片在右，文字在左，整体居中。
    JSButtonImageTitleStyleTop    = 2,  //图片在上，文字在下，整体居中。
    JSButtonImageTitleStyleBottom = 3,  //图片在下，文字在上，整体居中。
};

@interface UIButton (JSCategory)
#pragma mark 图片文字布局
/**
 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 注意: 这个方法需要在设置图片和文字之后才可以调用, 且button的大小要大于图片大小+文字大小+spacing
 */
- (void)setButtonImageTitleStyle:(JSButtonImageTitleStyle)style
                         spacing:(CGFloat)spacing;

@end
