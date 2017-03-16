//
//  NSData+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/12.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (JSCategory)
#pragma mark HASH
/**
 获取md2 HASH 字符串
 */
- (NSString *)js_md2String;

/**
 获取md2 HASH 二进制数据
 */
- (NSData *)js_md2Data;

/**
 获取md4 HASH 字符串
 */
- (NSString *)js_md4String;

/**
 获取md4 HASH 二进制数据
 */
- (NSData *)js_md4Data;

/**
 获取md5 HASH 字符串
 */
- (NSString *)js_md5String;

/**
 获取md5 HASH 二进制数据
 */
- (NSData *)js_md5Data;

/**
 获取sha1 HASH 字符串
 */
- (NSString *)js_sha1String;

/**
 获取sha1 HASH 二进制数据
 */
- (NSData *)js_sha1Data;

/**
 获取sha224 HASH 字符串
 */
- (NSString *)js_sha224String;

/**
 获取sha224 HASH 二进制数据
 */
- (NSData *)js_sha224Data;

/**
 获取sha256 HASH 字符串
 */
- (NSString *)js_sha256String;

/**
 获取sha256 HASH 二进制数据
 */
- (NSData *)js_sha256Data;

/**
 获取sha384 HASH 字符串
 */
- (NSString *)js_sha384String;

/**
 获取sha384 HASH 二进制数据
 */
- (NSData *)js_sha384Data;

/**
 获取sha512 HASH 字符串
 */
- (NSString *)js_sha512String;

/**
 获取sha512 HASH 二进制数据
 */
- (NSData *)js_sha512Data;

/**
 将秘钥以md5算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacMD5StringWithKey:(NSString *)key;

/**
 将秘钥以md5算法运算，获取相应的hmac二进制数据
 @param key  hmac秘钥
 */
- (NSData *)js_hmacMD5DataWithKey:(NSData *)key;

/**
 将秘钥以sha1算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA1StringWithKey:(NSString *)key;

/**
 将秘钥以sha1算法运算，获取相应的hmac二进制数据
 @param key  hmac秘钥
 */
- (NSData *)js_hmacSHA1DataWithKey:(NSData *)key;

/**
 将秘钥以sha224算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA224StringWithKey:(NSString *)key;

/**
 将秘钥以sha224算法运算，获取相应的hmac二进制数据
 @param key  hmac秘钥
 */
- (NSData *)js_hmacSHA224DataWithKey:(NSData *)key;

/**
 将秘钥以sha256算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA256StringWithKey:(NSString *)key;

/**
 将秘钥以sha256算法运算，获取相应的hmac二进制数据
 @param key  hmac秘钥
 */
- (NSData *)js_hmacSHA256DataWithKey:(NSData *)key;

/**
 将秘钥以sha384算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA384StringWithKey:(NSString *)key;

/**
 将秘钥以sha384算法运算，获取相应的hmac二进制数据
 @param key  hmac秘钥
 */
- (NSData *)js_hmacSHA384DataWithKey:(NSData *)key;

/**
 将秘钥以sha512算法运算，获取相应的hmac字符串
 @param key  hmac秘钥
 */
- (NSString *)js_hmacSHA512StringWithKey:(NSString *)key;

/**
 将秘钥以sha512算法运算，获取相应的hmac二进制数据
 @param key  hmac秘钥
 */
- (NSData *)js_hmacSHA512DataWithKey:(NSData *)key;

/**
 获取crc32 HASH 字符串
 */
- (NSString *)js_crc32String;

/**
 获取crc32 HASH
 */
- (uint32_t)js_crc32;

#pragma mark 加密与解密
/**
 获取使用aes256加密的二进制数据
 
 @param key   秘钥：长度为16、24或32位（128, 192 or 256bits）
 @param iv    初始化向量：长度16位（128bits）
 */
- (nullable NSData *)js_aes256EncryptWithKey:(NSData *)key
                                          iv:(nullable NSData *)iv;

/**
 获取aes256解密的二进制数据
 
 @param key   秘钥：长度为16、24或32位（128, 192 or 256bits）
 @param iv    初始化向量：长度16位（128bits）
 */
- (nullable NSData *)js_aes256DecryptWithkey:(NSData *)key
                                          iv:(nullable NSData *)iv;

#pragma mark 编码与解码
/**
 获取UTF8解码的字符串
 */
- (nullable NSString *)js_utf8String;

/**
 获取大写的十六进制字符串
 */
- (nullable NSString *)js_hexString;

/**
 获取十六进制字符串的二进制数据
 */
+ (nullable NSData *)js_dataWithHexString:(NSString *)hexString;

/**
 获取base64编码的字符串
 */
- (nullable NSString *)js_base64EncodedString;

/**
 获取base64编码的字符串的二进制数据
 */
+ (nullable NSData *)js_dataWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 获取解码后得到的NSDictionary或NSArray
 */
- (nullable id)js_jsonValueDecoded;

@end

NS_ASSUME_NONNULL_END
