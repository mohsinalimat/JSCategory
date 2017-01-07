# JSCategory

[![Version](https://img.shields.io/cocoapods/v/JSCategory.svg?style=flat)](http://cocoapods.org/pods/JSCategory)
[![License](https://img.shields.io/cocoapods/l/JSCategory.svg?style=flat)](http://cocoapods.org/pods/JSCategory)
[![Platform](https://img.shields.io/cocoapods/p/JSCategory.svg?style=flat)](http://cocoapods.org/pods/JSCategory)

JSCategory: 常用类别集合

## 导入方法
```ruby
pod 'JSCategory', '~> 1.2.0'
```

## 使用方法

### 头文件的导入
```objc
#import "JSCategory.h"
```

### NSArray+JSCategory

#### NSArray
```objc
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
```

#### NSMutableArray
```objc
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
```

### NSDictionary+JSCategory

#### NSDictionary
```objc
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
```

#### NSMutableDictionary
```objc 
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
```

### NSData+JSCategory
```objc 
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
```

### NSDate+JSCategory
```objc 
/**
年单位
*/
@property (nonatomic, readonly) NSInteger js_year;

/**
月单位：范围为1~12
*/
@property (nonatomic, readonly) NSInteger js_month;

/**
天单位：范围为1~31
*/
@property (nonatomic, readonly) NSInteger js_day;

/**
小时单位：范围为0~24
*/
@property (nonatomic, readonly) NSInteger js_hour;

/**
刻钟单位：范围为1~4
*/
@property (nonatomic, readonly) NSInteger js_quarter;

/**
分钟单位：范围为0~60
*/
@property (nonatomic, readonly) NSInteger js_minute;

/**
秒单位：范围为0~60
*/
@property (nonatomic, readonly) NSInteger js_second;

/**
纳秒：十亿分之一秒
*/
@property (nonatomic, readonly) NSInteger js_nanosecond;

/**
星期单位：范围为1~7，系统默认星期日是第一天
*/
@property (nonatomic, readonly) NSInteger js_weekday;

/**
以7天为单位：范围为1~5（1-7号为第1个7天，8-14号为第2个7天...）
*/
@property (nonatomic, readonly) NSInteger js_weekdayOrdinal;

/**
日期所在为当月第几周：范围为1~5
*/
@property (nonatomic, readonly) NSInteger js_weekOfMonth;

/**
日期所在为当年第几周：范围为1~53
*/
@property (nonatomic, readonly) NSInteger js_weekOfYear;

/**
是否为闰月
*/
@property (nonatomic, readonly) BOOL js_isLeapMonth;

/**
是否为闰年
*/
@property (nonatomic, readonly) BOOL js_isLeapYear;

/**
是否为昨日
*/
@property (nonatomic, readonly) BOOL js_isYesterday;

/**
是否为今日
*/
@property (nonatomic, readonly) BOOL js_isToday;

/**
是否为明日
*/
@property (nonatomic, readonly) BOOL js_isTomorrow;

/**
获得若干年后的时间
*/
- (nullable NSDate *)js_dateByAddingYears:(NSInteger)years;

/**
获得若干月后的时间
*/
- (nullable NSDate *)js_dateByAddingMonths:(NSInteger)months;

/**
获得若干周后的时间
*/
- (nullable NSDate *)js_dateByAddingWeeks:(NSInteger)weeks;

/**
获得若干天后的时间
*/
- (nullable NSDate *)js_dateByAddingDays:(NSInteger)days;

/**
获得若干小时后的时间
*/
- (nullable NSDate *)js_dateByAddingHours:(NSInteger)hours;

/**
获得若干分钟后的时间
*/
- (nullable NSDate *)js_dateByAddingMinutes:(NSInteger)minutes;

/**
获得若干秒后的时间
*/
- (nullable NSDate *)js_dateByAddingSeconds:(NSInteger)seconds;

/**
获取相应格式的字符串：@"yyyy-MM-dd HH:mm:ss"
*/
- (nullable NSString *)js_stringWithFormat:(NSString *)format;

/**
获取相应格式的字符串：格式化字符串、时区信息、语言信息

@param format   格式化字符串：@"yyyy-MM-dd HH:mm:ss"
@param timeZone 时区信息
@param locale   语言信息

@return 返回相应格式的字符串
*/
- (nullable NSString *)js_stringWithFormat:(NSString *)format
                                  timeZone:(nullable NSTimeZone *)timeZone
                                    locale:(nullable NSLocale *)locale;

/**
获取ISO8601格式的字符串：@"2016-12-08T12:13:51+0800"
*/
- (nullable NSString *)js_stringWithISOFormat;

/**
获取给定字符串依据ISO8601格式解析得到的日期
*/
+ (nullable NSDate *)js_dateWithISOFormatString:(NSString *)dateString;

/**
获取给定字符串依据给定格式解析得到的日期
*/
+ (nullable NSDate *)js_dateWithString:(NSString *)dateString
                                format:(NSString *)format;

/**
获取给定字符串依据给定格式解析得到的日期：时区信息、语言信息

@param timeZone 时区信息
@param locale   语言信息
*/
+ (nullable NSDate *)js_dateWithString:(NSString *)dateString
                                format:(NSString *)format
                              timeZone:(nullable NSTimeZone *)timeZone
                                locale:(nullable NSLocale *)locale;
```

### NSNumber+JSCategory
```objc 
/**
通过string创建相应的NSNumber
*/
+ (nullable NSNumber *)js_numberWithString:(NSString *)string;
```

### NSString+JSCategory
```objc
/**
获取md2 HASH 字符串
*/
- (nullable NSString *)js_md2String;

/**
获取md4 HASH 字符串
*/
- (nullable NSString *)js_md4String;

/**
获取md5 HASH 字符串
*/
- (nullable NSString *)js_md5String;

/**
获取sha1 HASH 字符串
*/
- (nullable NSString *)js_sha1String;

/**
获取sha224 HASH 字符串
*/
- (nullable NSString *)js_sha224String;

/**
获取sha256 HASH 字符串
*/
- (nullable NSString *)js_sha256String;

/**
获取sha384 HASH 字符串
*/
- (nullable NSString *)js_sha384String;

/**
获取sha512 HASH 字符串
*/
- (nullable NSString *)js_sha512String;

/**
将秘钥以md5算法运算，获取相应的hmac字符串
@param key  hmac秘钥 
*/
- (nullable NSString *)js_hmacMD5StringWithKey:(NSString *)key;

/**
将秘钥以sha1算法运算，获取相应的hmac字符串
@param key  hmac秘钥
*/
- (nullable NSString *)js_hmacSHA1StringWithKey:(NSString *)key;

/**
将秘钥以sha224算法运算，获取相应的hmac字符串
@param key  hmac秘钥
*/
- (nullable NSString *)js_hmacSHA224StringWithKey:(NSString *)key;

/**
将秘钥以sha256算法运算，获取相应的hmac字符串
@param key  hmac秘钥
*/
- (nullable NSString *)js_hmacSHA256StringWithKey:(NSString *)key;

/**
将秘钥以sha384算法运算，获取相应的hmac字符串
@param key  hmac秘钥 */
- (nullable NSString *)js_hmacSHA384StringWithKey:(NSString *)key;

/**
将秘钥以sha512算法运算，获取相应的hmac字符串
@param key  hmac秘钥
*/
- (nullable NSString *)js_hmacSHA512StringWithKey:(NSString *)key;

/**
获取crc32 HASH 字符串
*/
- (nullable NSString *)js_crc32String;

/**
获取base64编码的字符串
*/
- (nullable NSString *)js_base64EncodedString;

/**
获取base64编码字符串解码后的字符串
*/
+ (nullable NSString *)js_stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
获取URL经过UTF-8编码得到的字符串
*/
- (NSString *)js_stringByURLEncode;

/**
获取URL经过UTF-8解码得到的字符串
*/
- (NSString *)js_stringByURLDecode;

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

/**
是否与正则表达式一致

@param regex   正则表达式
@param options 匹配选项
*/
- (BOOL)js_matchesRegex:(NSString *)regex
                options:(NSRegularExpressionOptions)options;

@property (readonly) char js_charValue;
@property (readonly) unsigned char js_unsignedCharValue;
@property (readonly) short js_shortValue;
@property (readonly) unsigned short js_unsignedShortValue;
@property (readonly) unsigned int js_unsignedIntValue;
@property (readonly) long js_longValue;
@property (readonly) unsigned long js_unsignedLongValue;
@property (readonly) unsigned long long js_unsignedLongLongValue;
@property (readonly) NSUInteger js_unsignedIntegerValue;

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
```

### UIApplication+JSCategory
```objc
/**
Documents
*/
@property (nonatomic, readonly) NSURL *js_documentsURL;
@property (nonatomic, readonly) NSString *js_documentsPath;

/**
Cache
*/
@property (nonatomic, readonly) NSURL *js_cachesURL;
@property (nonatomic, readonly) NSString *js_cachesPath;

/**
Library
*/
@property (nonatomic, readonly) NSURL *js_libraryURL;
@property (nonatomic, readonly) NSString *js_libraryPath;

/**
Bundle Name
*/
@property (nullable, nonatomic, readonly) NSString *js_appBundleName;

/**
Bundle ID：例如：“com.Spirit.JSCategoryDemo”
*/
@property (nullable, nonatomic, readonly) NSString *js_appBundleID;

/**
Version
*/
@property (nullable, nonatomic, readonly) NSString *js_appVersion;

/**
Build number
*/
@property (nullable, nonatomic, readonly) NSString *js_appBuildVersion;
```

### UIButton+JSCategory
```objc
/**
利用 UIButton 的 titleEdgeInsets 和 imageEdgeInsets 来实现文字和图片的自由排列
注意: 这个方法需要在设置图片和文字之后才可以调用, 且 button 的大小要大于图片大小 + 文字大小 + spacing
*/
- (void)js_setButtonImageTitleStyle:(JSButtonImageTitleStyle)style
                            spacing:(CGFloat)spacing;
```

### UIColor+JSCategory
```objc
/**
获取相应的 HSL 和 Alpha 组成的颜色对象

@param hue        色相: 数值范围 0.0 到 1.0
@param saturation 饱和度: 数值范围 0.0 到 1.0
@param lightness  明度: 数值范围 0.0 到 1.0
@param alpha      颜色的透明通道: 数值范围 0.0 到 1.0
*/
+ (UIColor *)js_colorWithHue:(CGFloat)hue
                  saturation:(CGFloat)saturation
                   lightness:(CGFloat)lightness
                       alpha:(CGFloat)alpha;

/**
获取相应的 CMYK 和 Alpha 组成的颜色对象

@param cyan    青色: 数值范围 0.0 到 1.0
@param magenta 品红色: 数值范围 0.0 到 1.0
@param yellow  黄色: 数值范围 0.0 到 1.0
@param black   定位套版色 (黑色): 数值范围 0.0 到 1.0
@param alpha   颜色的透明通道: 数值范围 0.0 到 1.0
*/
+ (UIColor *)js_colorWithCyan:(CGFloat)cyan
                      magenta:(CGFloat)magenta
                       yellow:(CGFloat)yellow
                        black:(CGFloat)black
                        alpha:(CGFloat)alpha;

/**
获取相应的 RGB (Hex) 组成的颜色对象

@param rgbValue  RGB: 例如: 0x66ccff
*/
+ (UIColor *)js_colorWithRGB:(uint32_t)rgbValue;

/**
获取相应的 RGBA (Hex) 组成的颜色对象

@param rgbaValue  RGB: 例如: 0x66ccffff
*/
+ (UIColor *)js_colorWithRGBA:(uint32_t)rgbaValue;

/**
获取相应的 RGB (Hex) 和 Alpha 组成的颜色对象

@param rgbValue RGB: 例如: 0x66ccff
@param alpha    颜色的透明通道: 数值范围 0.0 到 1.0
*/
+ (UIColor *)js_colorWithRGB:(uint32_t)rgbValue
                       alpha:(CGFloat)alpha;

/**
获取相应的 HEX 组成的颜色对象

@param hexString HEX: 例如: @"0xF0F", @"66ccff", @"#66CCFF88"
*/
+ (nullable UIColor *)js_colorWithHexString:(NSString *)hexString;

/**
返回颜色的 RGB 数值 (HEX): 例如: 0x66ccff
*/
- (uint32_t)js_rgbValue;

/**
返回颜色的 RGBA 数值 (HEX): 例如: 0x66ccffff
*/
- (uint32_t)js_rgbaValue;

/**
返回颜色的 RGB 数值 (HEX) (小写字母): 例如: @"0066cc"

@warning 如果颜色空间不是 RGB 将会返回 nil
*/
- (nullable NSString *)js_hexString;

/**
返回颜色的 RGBA 数值 (HEX) (小写字母): 例如: @"0066ccff"

@warning 如果颜色空间不是 RGB 将会返回 nil
*/
- (nullable NSString *)js_hexStringWithAlpha;

/**
RGB 颜色的 Red 数值: 数值范围 0.0 到 1.0
*/
@property (nonatomic, readonly) CGFloat js_red;

/**
RGB 颜色的 Green 数值: 数值范围 0.0 到 1.0
*/
@property (nonatomic, readonly) CGFloat js_green;

/**
RGB 颜色的 Blue 数值: 数值范围 0.0 到 1.0
*/
@property (nonatomic, readonly) CGFloat js_blue;

/**
HSB 颜色的 Hue (色相) 数值: 数值范围 0.0 到 1.0
*/
@property (nonatomic, readonly) CGFloat js_hue;

/**
HSB 颜色的 Saturation (饱和度) 数值: 数值范围 0.0 到 1.0
*/
@property (nonatomic, readonly) CGFloat js_saturation;

/**
HSB 颜色的 Brightness (亮度) 数值: 数值范围 0.0 到 1.0
*/
@property (nonatomic, readonly) CGFloat js_brightness;

/**
颜色的 Alpha (透明通道) 数值: 数值范围 0.0 到 1.0
*/
@property (nonatomic, readonly) CGFloat js_alpha;

/**
颜色的色彩模式
*/
@property (nonatomic, readonly) CGColorSpaceModel js_colorSpaceModel;

/**
颜色的色彩模式
*/
@property (nullable, nonatomic, readonly) NSString *js_colorSpaceString;
```

### UIDevice+JSCategory
```objc
/**
设备是否为iPad/iPad mini
*/
@property (nonatomic, readonly) BOOL js_isPad;

/**
设备是否为模拟器
*/
@property (nonatomic, readonly) BOOL js_isSimulator;

/**
设备是否可以通话
*/
@property (nonatomic, readonly) BOOL js_canMakePhoneCalls;

/**
设备模型
@see http://theiphonewiki.com/wiki/Models
*/
@property (nullable, nonatomic, readonly) NSString *js_machineModel;

/**
设备模型名称
@see http://theiphonewiki.com/wiki/Models
*/
@property (nullable, nonatomic, readonly) NSString *js_machineModelName;

/**
系统的启动时间
*/
@property (nonatomic, readonly) NSDate *js_systemUptime;

/**
设备的系统版本号
*/
+ (double)js_systemVersion;

/**
WIFI IP地址
*/
@property (nullable, nonatomic, readonly) NSString *js_ipAddressWIFI;

/**
移动网络 IP地址
*/
@property (nullable, nonatomic, readonly) NSString *js_ipAddressCell;

/**
网络流量类型:

WWAN: 移动网络

WIFI: Wi-Fi.

AWDL: Apple Wireless Direct Link (点对点连接): AirDrop, AirPlay, GameKit
*/
typedef NS_OPTIONS (NSUInteger, JSNetworkTrafficType) {
JSNetworkTrafficTypeWWANSent     = 1 << 0,
JSNetworkTrafficTypeWWANReceived = 1 << 1,
JSNetworkTrafficTypeWIFISent     = 1 << 2,
JSNetworkTrafficTypeWIFIReceived = 1 << 3,
JSNetworkTrafficTypeAWDLSent     = 1 << 4,
JSNetworkTrafficTypeAWDLReceived = 1 << 5,

JSNetworkTrafficTypeWWAN = JSNetworkTrafficTypeWWANSent | JSNetworkTrafficTypeWWANReceived,
JSNetworkTrafficTypeWIFI = JSNetworkTrafficTypeWIFISent | JSNetworkTrafficTypeWIFIReceived,
JSNetworkTrafficTypeAWDL = JSNetworkTrafficTypeAWDLSent | JSNetworkTrafficTypeAWDLReceived,

JSNetworkTrafficTypeALL = JSNetworkTrafficTypeWWAN |
JSNetworkTrafficTypeWIFI |
JSNetworkTrafficTypeAWDL,
};

/**
获取设备网络流量字节

@discussion 统计设备自上一次启动后的总流量
Usage:

uint64_t bytes = [[UIDevice currentDevice] js_getNetworkTrafficBytes:JSNetworkTrafficTypeALL];
NSTimeInterval time = CACurrentMediaTime();

uint64_t bytesPerSecond = (bytes - _lastBytes) / (time - _lastTime);

_lastBytes = bytes;
_lastTime = time;


@param types 网络流量类型
*/
- (uint64_t)js_getNetworkTrafficBytes:(JSNetworkTrafficType)types;

/**
磁盘总空间字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_diskSpace;

/**
磁盘总空闲空间字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_diskSpaceFree;

/**
已使用的磁盘空间字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_diskSpaceUsed;

/**
总物理内存字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_memoryTotal;

/**
已使用内存字节数: (-1: 获取失败)
Wired(联动): 系统核心占用的，永远不会从系统物【[内存】中驱除。
Active(活跃): 表示这些内存数据正在使用种，或者刚被使用过。
Inactive(非活跃): 表示这些内存中的数据是有效的，但是最近没有被使用。
*/
@property (nonatomic, readonly) int64_t js_memoryUsed;

/**
空闲内存字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_memoryFree;

/**
Active(活跃状态)内存字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_memoryActive;

/**
Inactive(非活跃状态)内存字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_memoryInactive;

/**
Wired(联动状态)内存字节数: (-1: 获取失败)
*/
@property (nonatomic, readonly) int64_t js_memoryWired;

/**
CPU核心数
*/
@property (nonatomic, readonly) NSUInteger js_cpuCount;

/**
当前CPU使用率: 1.0=>100% (-1: 获取失败)
*/
@property (nonatomic, readonly) float js_cpuUsage;

/**
当前CPU个核心使用率: 1.0=>100% (nil: 获取失败)
*/
@property (nullable, nonatomic, readonly) NSArray<NSNumber *> *js_cpuUsagePerProcessor;
```

### UIImage+JSCategory
```objc
/**
通过 GIF 的二进制文件创建动画图片. 创建之后, 可以通过属性 '.image' 加载.
如果该二进制文件不是可动的 GIF, 该方法等同于 '[UIImage imageWithData:data scale:scale]'

@discussion  该方法加载性能良好, 但是会占用较多的内存空间 (width * height * frames 字节).
仅适用于加载较小的 GIF 图片, 例如: 可动的 Emoji.

@param data   GIF 的二进制数据
@param scale  缩放比例
*/
+ (nullable UIImage *)js_imageWithSmallGIFData:(NSData *)data
                                         scale:(CGFloat)scale;

/**
该二进制文件是否为可动的 GIF 文件.
*/
+ (BOOL)js_isAnimatedGIFData:(NSData *)data;

/**
指定文件路径的文件是否为 GIF.
*/
+ (BOOL)js_isAnimatedGIFFile:(NSString *)path;

/**
通过 PDF 文件数据或路径创建图片

@discussion  如果该 PDF 文件包含多页, 仅返回第一页的内容.
Image's 比例与当前屏幕比例相同, 尺寸与 PDF's 原尺寸相同

@param dataOrPath PDF 数据: 'NSData' 或 PDF 文件路径: 'NSString'

@warning 当发生错误时, 返回 nil
*/
+ (nullable UIImage *)js_imageWithPDF:(id)dataOrPath;

/**
通过 PDF 文件数据或路径创建图片

@discussion  如果该 PDF 文件包含多页, 仅返回第一页的内容.
Image's 比例与当前屏幕比例相同

@param dataOrPath PDF 数据: 'NSData' 或 PDF 文件路径: 'NSString'
@param size 新图片的尺寸, PDF 格式的内容会进行拉伸

@warning 当发生错误时, 返回 nil
*/
+ (nullable UIImage *)js_imageWithPDF:(id)dataOrPath
                                 size:(CGSize)size;

/**
创建 Emoji 表情图片
*/
+ (nullable UIImage *)js_imageWithEmoji:(NSString *)emoji
                                   size:(CGFloat)size;

/**
通过颜色创建一个 1x1 的图片
*/
+ (nullable UIImage *)js_imageWithColor:(UIColor *)color;

/**
通过颜色创建指定大小的图片
*/
+ (nullable UIImage *)js_imageWithColor:(UIColor *)color
                                   size:(CGSize)size;

/**
通过自定义绘制代码创建并返回一个图像
*/
+ (nullable UIImage *)js_imageWithSize:(CGSize)size
                             drawBlock:(void (^)(CGContextRef context))drawBlock;

/**
图片是否包含alpha通道
*/
- (BOOL)js_hasAlphaChannel;

/**
在指定尺寸的矩形内绘制图像内容, 图像内容将依据 contentMode 改变
*/
- (void)js_drawInRect:(CGRect)rect
      withContentMode:(UIViewContentMode)contentMode
        clipsToBounds:(BOOL)clips;

/**
获取一张经过缩放的图片
图片可能会被拉伸
*/
- (nullable UIImage *)js_imageByResizeToSize:(CGSize)size;

/**
获取一张经过缩放的图片 - 改变了图片的展示模式
*/
- (nullable UIImage *)js_imageByResizeToSize:(CGSize)size
                                 contentMode:(UIViewContentMode)contentMode;

/**
获取一张经过裁剪的图片
*/
- (nullable UIImage *)js_imageByCropToRect:(CGRect)rect;

/**
获取一张经过边缘插入后的图片

@param insets  边缘插入 (正数), 数值可以为负数
@param color   边缘插入填充颜色, nil 表示颜色为透明色
*/
- (nullable UIImage *)js_imageByInsetEdge:(UIEdgeInsets)insets
                                withColor:(nullable UIColor *)color;

/**
获取一张经过裁剪圆角的图片

@param radius  圆角半径
*/
- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius;

/**
获取一张经过裁剪圆角的图片, 边缘插图宽度, 边缘插图颜色

@param radius       圆角半径
@param borderWidth  边缘插图边界线宽度
@param borderColor  边缘插入颜色
*/
- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor;

/**
获取一张经过裁剪圆角的图片, 边角 (左上, 右上, 左下, 右下), 边缘插图宽度, 边缘插图颜色, 接合类型

@param radius         圆角半径
@param corners        边角 (左上, 右上, 左下, 右下)
@param borderWidth    边缘插图边界线宽度
@param borderColor    边缘插入颜色
@param borderLineJoin 连线接合类型
*/
- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius
                                          corners:(UIRectCorner)corners
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor
                                   borderLineJoin:(CGLineJoin)borderLineJoin;

/**
获取旋转后的图像 (相对于中心点)

@param radians   逆时针旋转弧度 ⟲
@param fitSize   YES: 新图片的尺寸将会改变以适应旋转
NO: 新图片的尺寸不会改变
*/
- (nullable UIImage *)js_imageByRotate:(CGFloat)radians
                               fitSize:(BOOL)fitSize;

/**
获取逆时针旋转 90° 后的图像 ⤺
图像的宽高将互换
*/
- (nullable UIImage *)js_imageByRotateLeft90;

/**
获取顺时针旋转 90° 后的图像 ⤼
图像的宽高将互换
*/
- (nullable UIImage *)js_imageByRotateRight90;

/**
获取旋转 180° 后的图像 ↻
*/
- (nullable UIImage *)js_imageByRotate180;

/**
获取垂直翻转后的图像 ⥯
*/
- (nullable UIImage *)js_imageByFlipVertical;

/**
获取水平翻转后的图像 ⇋
*/
- (nullable UIImage *)js_imageByFlipHorizontal;

/**
Tint Color
*/
- (nullable UIImage *)js_imageByTintColor:(UIColor *)color;

/**
获取一个灰度图像
*/
- (nullable UIImage *)js_imageByGrayscale;

/**
获取图像的模糊效果, 适用于模糊任何内容
*/
- (nullable UIImage *)js_imageByBlurSoft;

/**
获取图像的模糊效果, 适用于模糊除纯白色以外的任何内容 (效果类似 iOS Control Panel)
*/
- (nullable UIImage *)js_imageByBlurLight;

/**
获取图像的模糊效果, 适用于显示黑色文本 (效果类似 iOS Navigation Bar White)
*/
- (nullable UIImage *)js_imageByBlurExtraLight;

/**
获取图像的模糊效果, 适用于显示白色文本 (效果类似 iOS Notification Center)
*/
- (nullable UIImage *)js_imageByBlurDark;

/**
获取图像的 Tint Color 模糊效果
*/
- (nullable UIImage *)js_imageByBlurWithTint:(UIColor *)tintColor;

/**
Applies a blur, tint color, and saturation adjustment to this image,
optionally within the area specified by @a maskImage.

@param blurRadius     The radius of the blur in points, 0 means no blur effect.

@param tintColor      An optional UIColor object that is uniformly blended with
the result of the blur and saturation operations. The
alpha channel of this color determines how strong the
tint is. nil means no tint.

@param tintBlendMode  The @a tintColor blend mode. Default is kCGBlendModeNormal (0).

@param saturation     A value of 1.0 produces no change in the resulting image.
Values less than 1.0 will desaturation the resulting image
while values greater than 1.0 will have the opposite effect.
0 means gray scale.

@param maskImage      If specified, @a inputImage is only modified in the area(s)
defined by this mask.  This must be an image mask or it
must meet the requirements of the mask parameter of
CGContextClipToMask.

@return               image with effect, or nil if an error occurs (e.g. no
enough memory).
*/
- (nullable UIImage *)js_imageByBlurRadius:(CGFloat)blurRadius
                                 tintColor:(nullable UIColor *)tintColor
                                  tintMode:(CGBlendMode)tintBlendMode
                                saturation:(CGFloat)saturation
                                 maskImage:(nullable UIImage *)maskImage;
```

### UIView+JSCategory
```objc
/**
全屏幕抓拍
*/
- (nullable UIImage *)js_snapshotImage;

/**
全屏幕抓拍 - PDF
*/
- (nullable NSData *)js_snapshotPDF;

/**
设置图层阴影

@param color  阴影颜色
@param offset 阴影偏移量
@param radius 阴影半径
*/
- (void)js_setLayerShadow:(nullable UIColor*)color
                   offset:(CGSize)offset
                   radius:(CGFloat)radius;

/**
移除所有的子视图

@warning 禁止在你的 view's 的 "drawRect:" 方法中调用该函数
*/
- (void)js_removeAllSubviews;

/**
获取该视图的控制器 (可能为nil)
*/
@property (nullable, nonatomic, readonly) UIViewController *js_viewController;

@property (nonatomic) CGFloat js_left;        ///< 快捷获取 frame.origin.x.
@property (nonatomic) CGFloat js_top;         ///< 快捷获取 frame.origin.y
@property (nonatomic) CGFloat js_right;       ///< 快捷获取 frame.origin.x + frame.size.width
@property (nonatomic) CGFloat js_bottom;      ///< 快捷获取 frame.origin.y + frame.size.height
@property (nonatomic) CGFloat js_width;       ///< 快捷获取 frame.size.width.
@property (nonatomic) CGFloat js_height;      ///< 快捷获取 frame.size.height.
@property (nonatomic) CGFloat js_centerX;     ///< 快捷获取 center.x
@property (nonatomic) CGFloat js_centerY;     ///< 快捷获取 center.y
@property (nonatomic) CGPoint js_origin;      ///< 快捷获取 frame.origin.
@property (nonatomic) CGSize  js_size;        ///< 快捷获取 frame.size.

```

## 作者

spirit-jsb, spirit1437419996@163.com

## 许可协议

JSCategory 遵循 MIT 开源许可证, 详情请查看 LICENSE 文件
