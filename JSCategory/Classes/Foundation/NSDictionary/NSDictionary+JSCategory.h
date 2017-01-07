//
//  NSDictionary+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 17/1/4.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JSCategory)
#pragma mark 组件方法
/**
 获取指定的属性列表数据的字典
 
 @param plist 属性列表数据: 根数据为一个字典
 */
+ (nullable NSDictionary *)js_dictionaryWithPlistData:(NSData *)plist;

/**
 获取指定的属性列表 XML 字符串的字典
 
 @param plist 属性列表 XML 字符串: 根数据为一个字典
 */
+ (nullable NSDictionary *)js_dictionaryWithPlistString:(NSString *)plist;

/**
 返回二进制属性列表数据的序列化字典
 */
- (nullable NSData *)js_plistData;

/**
 返回 XML 属性列表字符串的序列化字典
 */
- (nullable NSString *)js_plistString;

/**
 返回一个新的数组, 其中包含字典的 Key, Key 为字符串类型, 且按照升序排列
 
 @warning 如果该字典没有键值对, 返回一个空数组
 */
- (NSArray *)js_allKeysSorted;

/**
 返回一个新的数组, 其中包含依照字典 Key 排序的 Value
 
 @warning 数组中的 Value 的顺序是依照 Key 定义的
 Key 为字符串类型, 且按照升序排列
 */
- (NSArray *)js_allValuesSortedByKeys;

/**
 返回一个 BOOL 值, 告知字典中是否包含该 Value - Key
 */
- (BOOL)js_containsObjectForKey:(id)key;

/**
 返回一个新的字典, 包含 Keys 中所拥有的 Key - Value
 如果 Keys 为空或 nil, 将会返回一个空的字典
 */
- (NSDictionary *)js_entriesForKeys:(NSArray *)keys;

/**
 字典转换为 JSON 字符串, 如果出现错误返回 nil
 */
- (nullable NSString *)js_jsonStringEncoded;

/**
 字典转换为 JSON 格式化字符串, 如果出现错误返回 nil
 */
- (nullable NSString *)js_jsonPrettyStringEncoded;

/**
 尝试将 XML 解析并包装成一个字典
 如果需要将一个 XML 片段中的值解析出来, 可以尝试该方法
 
 
 例如 XML: "<config><a href="test.com">link</a></config>"
 例如 Return: @{@"_name":@"config", @"a":{@"_text":@"link",@"href":@"test.com"}}
 
 @param xmlDataOrString 二进制数据格式或字符串格式 XML
 */
+ (nullable NSDictionary *)js_dictionaryWithXML:(id)xmlDataOrString;

#pragma mark Dictionary Value Getter
- (BOOL)js_boolValueForKey:(NSString *)key
                   default:(BOOL)def;

- (char)js_charValueForKey:(NSString *)key
                   default:(char)def;

- (unsigned char)js_unsignedCharValueForKey:(NSString *)key
                                    default:(unsigned char)def;

- (short)js_shortValueForKey:(NSString *)key
                     default:(short)def;

- (unsigned short)js_unsignedShortValueForKey:(NSString *)key
                                      default:(unsigned short)def;

- (int)js_intValueForKey:(NSString *)key
                 default:(int)def;

- (unsigned int)js_unsignedIntValueForKey:(NSString *)key
                                  default:(unsigned int)def;

- (long)js_longValueForKey:(NSString *)key
                   default:(long)def;

- (unsigned long)js_unsignedLongValueForKey:(NSString *)key
                                    default:(unsigned long)def;

- (long long)js_longLongValueForKey:(NSString *)key
                            default:(long long)def;

- (unsigned long long)js_unsignedLongLongValueForKey:(NSString *)key
                                             default:(unsigned long long)def;

- (float)js_floatValueForKey:(NSString *)key
                     default:(float)def;

- (double)js_doubleValueForKey:(NSString *)key
                       default:(double)def;

- (NSInteger)js_integerValueForKey:(NSString *)key
                           default:(NSInteger)def;

- (NSUInteger)js_unsignedIntegerValueForKey:(NSString *)key
                                    default:(NSUInteger)def;

- (nullable NSNumber *)js_numberValueForKey:(NSString *)key
                                    default:(nullable NSNumber *)def;

- (nullable NSString *)js_stringValueForKey:(NSString *)key
                                    default:(nullable NSString *)def;

@end

@interface NSMutableDictionary (JSCategory)
#pragma mark 组件方法
/**
 获取指定的属性列表数据的字典
 
 @param plist 属性列表数据: 根数据为一个字典
 */
+ (nullable NSMutableDictionary *)js_dictionaryWithPlistData:(NSData *)plist;

/**
 获取指定的属性列表 XML 字符串的字典
 
 @param plist 属性列表 XML 字符串: 根数据为一个字典
 */
+ (nullable NSMutableDictionary *)js_dictionaryWithPlistString:(NSString *)plist;


/**
 删除并返回与给定的 Key 相关联的 Value
 */
- (nullable id)js_popObjectForKey:(id)aKey;

/**
 删除并返回与给定的 Keys 相关的 Values, 如果 Keys 为空或 nil, 将返回一个空的字典
 */
- (NSDictionary *)js_popEntriesForKeys:(NSArray *)keys;

@end

NS_ASSUME_NONNULL_END
