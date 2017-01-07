//
//  NSArray+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 17/1/3.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (JSCategory)
#pragma mark 组件方法
/**
 获取指定的属性列表数据的数组
 
 @param plist 属性列表数据: 根数据为一个数组
 */
+ (nullable NSArray *)js_arrayWithPlistData:(NSData *)plist;

/**
 获取指定的属性列表 XML 字符串的数组
 
 @param plist 属性列表 XML 字符串: 根数据为一个数组
 */
+ (nullable NSArray *)js_arrayWithPlistString:(NSString *)plist;

/**
 返回二进制属性列表数据的序列化数组
 */
- (nullable NSData *)js_plistData;

/**
 返回 XML 属性列表字符串的序列化数组
 */
- (nullable NSString *)js_plistString;

/**
 随机返回一个数组对象
 */
- (nullable id)js_randomObject;

/**
 返回位于数组边界内 index 的数组对象, 当 index 超出数组边界时, 返回 nil
 类似于 'objectAtIndex:', 但是无需担心数组越界
 */
- (nullable id)js_objectOrNilAtIndex:(NSUInteger)index;

/**
 将对象转化为 JSON 字符串, 如果出现错误, 返回 nil
 NSString / NSNumber / NSDictionary / NSArray
 */
- (nullable NSString *)js_jsonStringEncoded;

/**
 将对象转化为 JSON 格式化字符串, 如果出现错误, 返回 nil
 */
- (nullable NSString *)js_jsonPrettyStringEncoded;

@end

@interface NSMutableArray (JSCategory)
#pragma mark 组件方法
/**
 获取指定的属性列表数据的数组
 
 @param plist 属性列表数据: 根数据为一个数组
 */
+ (nullable NSMutableArray *)js_arrayWithPlistData:(NSData *)plist;

/**
 获取指定的属性列表 XML 字符串的数组
 
 @param plist 属性列表 XML 字符串: 根数据为一个数组
 */
+ (nullable NSMutableArray *)js_arrayWithPlistString:(NSString *)plist;

/**
 删除当前数组 first-index 对象, 如果数组为空, 该方法无效
 */
- (void)js_removeFirstObject;

/**
 删除当前数组 last-index 对象, 如果数组为空, 该方法无效
 */
- (void)js_removeLastObject;

/**
 删除并返回当前数组 first-index 对象, 如果数组为空, 返回 nil
 */
- (nullable id)js_popFirstObject;

/**
 删除并返回当前数组 last-index 对象, 如果数组为空, 返回 nil
 */
- (nullable id)js_popLastObject;

/**
 在当前数组末尾插入一个对象
 
 @warning 该对象严禁为 nil, 如果该对象为 nil 会抛出 NSInvalidArgumentException
 */
- (void)js_appendObject:(id)anObject;

/**
 在当前数组开头插入一个对象
 
 @warning 该对象严禁为 nil, 如果该对象为 nil 会抛出 NSInvalidArgumentException
 */
- (void)js_prependObject:(id)anObject;

/**
 在当前数组末尾插入一个数组对象
 
 如果该数组对象为空或 nil, 该方法无效
 */
- (void)js_appendObjects:(NSArray *)objects;

/**
 在当前数组开头插入一个数组对象
 
 如果该数组对象为空或 nil, 该方法无效
 */
- (void)js_prependObjects:(NSArray *)objects;

/**
 将另一个数组对象一次插入到当前数组 index 之后的位置
 
 @param objects 如果该数组为空或 nil, 该方法无效
 
 @param index 插入索引, index 必须小于当前数组长度, 如果 index 超过当前数组长度, 将会抛出 NSRangeException
 */
- (void)js_insertObjects:(NSArray *)objects
                 atIndex:(NSUInteger)index;

/**
 反向索引数组对象
 
 例如: Before @[ @1, @2, @3 ], After @[ @3, @2, @1 ].
 */
- (void)js_reverse;

/**
 数组对象随机排序
 */
- (void)js_shuffle;

@end

NS_ASSUME_NONNULL_END
