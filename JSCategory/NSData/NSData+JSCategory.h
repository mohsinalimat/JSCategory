//
//  NSData+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/8.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (JSCategory)
#pragma mark HASH
/**
 获取MD2 HASH 字符串
 */
- (nullable NSString *)MD2String;

/**
 获取MD2 HASH 二进制数据
 */
- (nullable NSData *)MD2Data;

/**
 获取MD4 HASH 字符串
 */
- (nullable NSString *)MD4String;

/**
 获取MD4 HASH 二进制数据
 */
- (nullable NSData *)MD4Data;

/**
 获取MD5 HASH 字符串
 */
- (nullable NSString *)MD5String;

/**
 获取MD5 HASH 二进制数据
 */
- (nullable NSData *)MD5Data;

/**
 获取SHA1 HASH 字符串
 */
- (nullable NSString *)SHA1String;

/**
 获取SHA1 HASH 二进制数据
 */
- (nullable NSData *)SHA1Data;

/**
 获取SHA224 HASH 字符串
 */
- (nullable NSString *)SHA224String;

/**
 获取SHA224 HASH 二进制数据
 */
- (nullable NSData *)SHA224Data;

/**
 获取SHA256 HASH 字符串
 */
- (nullable NSString *)SHA256String;

/**
 获取SHA256 HASH 二进制数据
 */
- (nullable NSData *)SHA256Data;

/**
 获取SHA384 HASH 字符串
 */
- (nullable NSString *)SHA384String;

/**
 获取SHA384 HASH 二进制数据
 */
- (nullable NSData *)SHA384Data;

/**
 获取SHA512 HASH 字符串
 */
- (nullable NSString *)SHA512String;

/**
 获取SHA512 HASH 二进制数据
 */
- (nullable NSData *)SHA512Data;

/**
 将秘钥以MD5算法运算，获取相应的HMAC字符串
 @param key  HMAC秘钥
 */
- (nullable NSString *)HMACMD5StringWithKey:(nullable NSString *)key;

/**
 将秘钥以MD5算法运算，获取相应的HMAC二进制数据
 @param key  HMAC秘钥
 */
- (nullable NSData *)HMACMD5DataWithKey:(nullable NSData *)key;

/**
 将秘钥以SHA1算法运算，获取相应的HMAC字符串
 @param key  HMAC秘钥
 */
- (nullable NSString *)HMACSHA1StringWithKey:(nullable NSString *)key;

/**
 将秘钥以SHA1算法运算，获取相应的HMAC二进制数据
 @param key  HMAC秘钥
 */
- (nullable NSData *)HMACSHA1DataWithKey:(nullable NSData *)key;

/**
 将秘钥以SHA224算法运算，获取相应的HMAC字符串
 @param key  HMAC秘钥
 */
- (nullable NSString *)HMACSHA224StringWithKey:(nullable NSString *)key;

/**
 将秘钥以SHA224算法运算，获取相应的HMAC二进制数据
 @param key  HMAC秘钥
 */
- (nullable NSData *)HMACSHA224DataWithKey:(nullable NSData *)key;

/**
 将秘钥以SHA256算法运算，获取相应的HMAC字符串
 @param key  HMAC秘钥
 */
- (nullable NSString *)HMACSHA256StringWithKey:(nullable NSString *)key;

/**
 将秘钥以SHA256算法运算，获取相应的HMAC二进制数据
 @param key  HMAC秘钥
 */
- (nullable NSData *)HMACSHA256DataWithKey:(nullable NSData *)key;

/**
 将秘钥以SHA384算法运算，获取相应的HMAC字符串
 @param key  HMAC秘钥
 */
- (nullable NSString *)HMACSHA384StringWithKey:(nullable NSString *)key;

/**
 将秘钥以SHA384算法运算，获取相应的HMAC二进制数据
 @param key  HMAC秘钥
 */
- (nullable NSData *)HMACSHA384DataWithKey:(nullable NSData *)key;

/**
 将秘钥以SHA512算法运算，获取相应的HMAC字符串
 @param key  HMAC秘钥
 */
- (nullable NSString *)HMACSHA512StringWithKey:(nullable NSString *)key;

/**
 将秘钥以SHA512算法运算，获取相应的HMAC二进制数据
 @param key  HMAC秘钥
 */
- (nullable NSData *)HMACSHA512DataWithKey:(nullable NSData *)key;

/**
 获取CRC32 HASH 字符串
 */
- (nullable NSString *)CRC32String;

/**
 获取CRC32 HASH
 */
- (uint32_t)CRC32;

#pragma mark 加密与解密
/**
 获取使用AES256加密的二进制数据
 
 @param key   秘钥：长度为16、24或32位（128, 192 or 256bits）
 @param iv    初始化向量：长度16位（128bits）
 */
- (nullable NSData *)AES256EncryptWithKey:(nullable NSData *)key
                                       iv:(nullable NSData *)iv;

/**
 获取AES256解密的二进制数据
 
 @param key   秘钥：长度为16、24或32位（128, 192 or 256bits）
 @param iv    初始化向量：长度16位（128bits）
 */
- (nullable NSData *)AES256DecryptWithkey:(nullable NSData *)key
                                       iv:(nullable NSData *)iv;

#pragma mark 编码与解码
/**
 获取UTF8解码的字符串
 */
- (nullable NSString *)UTF8String;

/**
 获取大写的十六进制字符串
 */
- (nullable NSString *)HexString;

/**
 获取十六进制字符串的二进制数据
 */
+ (nullable NSData *)dataWithHexString:(nullable NSString *)hexString;

/**
 获取base64编码的字符串
 */
- (nullable NSString *)base64EncodedString;

/**
 获取base64编码的字符串的二进制数据
 */
+ (nullable NSData *)dataWithBase64EncodedString:(nullable NSString *)base64EncodedString;

/**
 获取解码获得数组或字典
 */
- (nullable id)jsonValueDecoded;

#pragma mark 压缩与解压缩
/**
 获取GZIP解压缩后的数据
 */
- (nullable NSData *)gzipInflate;

/**
 获取GZIP压缩后的数据：默认压缩级别
 */
- (nullable NSData *)gzipDeflate;

/**
 获取ZLIB解压缩后的数据
 */
- (nullable NSData *)zlibInflate;

/**
 获取ZLIB压缩后的数据：默认压缩级别
 */
- (nullable NSData *)zlibDeflate;

#pragma mark Other
/**
 创建二进制数据文件
 */
+ (nullable NSData *)dataNamed:(nullable NSString *)name;

@end
