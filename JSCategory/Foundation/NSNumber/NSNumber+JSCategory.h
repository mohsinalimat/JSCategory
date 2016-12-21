//
//  NSNumber+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/12.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (JSCategory)
#pragma mark NSNumber
/**
 通过string创建相应的NSNumber
 */
+ (NSNumber *)js_numberWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
