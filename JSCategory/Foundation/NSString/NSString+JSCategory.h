//
//  NSString+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/12.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JSCategory)
#pragma mark HASH
/**
 获取md2 HASH 字符串
 */
- (NSString *)js_md2String;

/**
 获取md4 HASH 字符串
 */
- (NSString *)js_md4String;

/**
 获取md5 HASH 字符串
 */
- (NSString *)js_md5String;

/**
 获取sha1 HASH 字符串
 */
- (NSString *)js_sha1String;

/**
 获取sha224 HASH 字符串
 */
- (NSString *)js_sha224String;

/**
 获取sha256 HASH 字符串
 */
- (NSString *)js_sha256String;

/**
 获取sha384 HASH 字符串
 */
- (NSString *)js_sha384String;

/**
 获取sha512 HASH 字符串
 */
- (NSString *)js_sha512String;

/**
 将秘钥以md5算法运算，获取相应的hmac字符串
 @param key  hmac秘钥 
 */
- (NSString *)js_hmacMD5StringWithKey:(NSString *)key;

/**
 将秘钥以sha1算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA1StringWithKey:(NSString *)key;

/**
 将秘钥以sha224算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA224StringWithKey:(NSString *)key;

/**
 将秘钥以sha256算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA256StringWithKey:(NSString *)key;

/**
 将秘钥以sha384算法运算，获取相应的hmac字符串
 @param key  hmac秘钥 */
- (NSString *)js_hmacSHA384StringWithKey:(NSString *)key;

/**
 将秘钥以sha512算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA512StringWithKey:(NSString *)key;

/**
 获取crc32 HASH 字符串
 */
- (NSString *)js_crc32String;

#pragma mark 编码与解码
/**
 获取base64编码的字符串
 */
- (NSString *)js_base64EncodedString;

/**
 获取base64编码字符串解码后的字符串
 */
+ (NSString *)js_stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 获取URL经过UTF-8编码得到的字符串
 */
- (NSString *)js_stringByURLEncode;

/**
 获取URL经过UTF-8解码得到的字符串
 */
- (NSString *)js_stringByURLDecode;

#pragma mark Drawing
/**
 获取相应字符串的尺寸
 
 @param font          UIFont
 @param size          UILabel、UITextField、UITextView的尺寸
 @param lineBreakMode lineBreakMode
 */
- (CGSize)js_sizeForFont:(UIFont *)font
                    size:(CGSize)size
                    mode:(NSLineBreakMode)lineBreakMode;

/**
 获取相应字符串的宽度
 */
- (CGFloat)js_widthForFont:(UIFont *)font;

/**
 获取相应字符串的高度
 */
- (CGFloat)js_heightForFont:(UIFont *)font
                      width:(CGFloat)width;

#pragma mark 正则表达式
/**
 是否与正则表达式一致

 @param regex   正则表达式
 @param options 匹配选项
 */
- (BOOL)js_matchesRegex:(NSString *)regex
                options:(NSRegularExpressionOptions)options;

#pragma mark NSNumber
@property (readonly) char js_charValue;
@property (readonly) unsigned char js_unsignedCharValue;
@property (readonly) short js_shortValue;
@property (readonly) unsigned short js_unsignedShortValue;
@property (readonly) unsigned int js_unsignedIntValue;
@property (readonly) long js_longValue;
@property (readonly) unsigned long js_unsignedLongValue;
@property (readonly) unsigned long long js_unsignedLongLongValue;
@property (readonly) NSUInteger js_unsignedIntegerValue;

#pragma mark Other
/**
 UUID
 */
+ (NSString *)js_stringWithUUID;

/**
 修剪头部和尾部的空白字符（空格和换行符）
 */
- (NSString *)js_stringByTrim;

/**
 nil, @"", @"  ", @"\n"返回NO；其余的返回YES
 */
- (BOOL)js_isNotBlank;

/**
 string是否包含于当前字符串中
 */
- (BOOL)js_containsString:(NSString *)string;

/**
 获得相应的NSNumer
 */
- (NSNumber *)js_numberValue;

/**
 获得UTF-8编码的二进制数据
 */
- (NSData *)js_dataValue;

/**
 获得NSMakeRange(0, self.length).
 */
- (NSRange)js_rangeOfAll;

/**
 获得相应的NSDictionary/NSArray
 */
- (id)js_jsonValueDecoded;

@end

NS_ASSUME_NONNULL_END
