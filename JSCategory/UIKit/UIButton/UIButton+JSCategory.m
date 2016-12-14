//
//  UIButton+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "UIButton+JSCategory.h"

#import "NSString+JSCategory.h"

@implementation UIButton (JSCategory)
#pragma mark 图片文字布局
- (void)setButtonImageTitleStyle:(JSButtonImageTitleStyle)style
                         spacing:(CGFloat)spacing
{
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;

    CGFloat labelWidth = [self.titleLabel.text js_widthForFont:self.titleLabel.font];
    CGFloat labelHeight = [self.titleLabel.text js_heightForFont:self.titleLabel.font
                                                           width:labelWidth];
    
    //  image中心移动的X距离
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;
    //  image中心移动的Y距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;
    
    //  label中心移动的X距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;
    //  label中心移动的Y距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (style)
    {
        case JSButtonImageTitleStyleLeft:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, - spacing / 2, 0, spacing / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, - spacing / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, spacing / 2);
        }
            break;
        case JSButtonImageTitleStyleRight:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing / 2, 0, - (labelWidth + spacing / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - (imageWidth + spacing / 2), 0, imageWidth + spacing / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, spacing / 2);
        }
            break;
        case JSButtonImageTitleStyleTop:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(- imageOffsetY, imageOffsetX, imageOffsetY, - imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, - labelOffsetX, - labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, - changedWidth / 2, changedHeight - imageOffsetY, - changedWidth / 2);
        }
            break;
        case JSButtonImageTitleStyleBottom:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, - imageOffsetY, - imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(- labelOffsetY, - labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight - imageOffsetY, - changedWidth / 2, imageOffsetY, - changedWidth / 2);
        }
            break;
        default:
        {
            
        }
            break;
    }
}

@end
