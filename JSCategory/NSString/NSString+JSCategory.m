//
//  NSString+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/12.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "NSString+JSCategory.h"

#import "NSData+JSCategory.h"
#import "NSNumber+JSCategory.h"

@implementation NSString (JSCategory)
#pragma mark HASH
- (NSString *)js_md2String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_md2String];
}

- (NSString *)js_md4String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_md4String];
}

- (NSString *)js_md5String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_md5String];
}

- (NSString *)js_sha1String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_sha1String];
}

- (NSString *)js_sha224String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_sha224String];
}

- (NSString *)js_sha256String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_sha256String];
}

- (NSString *)js_sha384String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_sha384String];
}

- (NSString *)js_sha512String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_sha512String];
}

- (NSString *)js_hmacMD5StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            js_hmacMD5StringWithKey:key];
}

- (NSString *)js_hmacSHA1StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            js_hmacSHA1StringWithKey:key];
}

- (NSString *)js_hmacSHA224StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            js_hmacSHA224StringWithKey:key];
}

- (NSString *)js_hmacSHA256StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            js_hmacSHA256StringWithKey:key];
}

- (NSString *)js_hmacSHA384StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            js_hmacSHA384StringWithKey:key];
}

- (NSString *)js_hmacSHA512StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            js_hmacSHA512StringWithKey:key];
}

- (NSString *)crc32String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] js_crc32String];
}

#pragma mark 编码与解码
- (NSString *)js_base64EncodedString
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            js_base64EncodedString];
}

+ (NSString *)js_stringWithBase64EncodedString:(NSString *)base64EncodedString
{
    NSData *data = [NSData js_dataWithBase64EncodedString:base64EncodedString];
    
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}

- (NSString *)js_stringByURLEncode
{
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)])
    {
        /**
         AFNetworking/AFURLRequestSerialization.m
         
         Returns a percent-escaped string following RFC 3986 for a query string key or value.
         RFC 3986 states that the following characters are "reserved" characters.
         - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
         - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
         In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
         query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
         should be percent-escaped in the query string.
         - parameter string: The string to be percent-escaped.
         - returns: The percent-escaped string.
         */
        static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
        
        static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
        
        NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        
        [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
        
        static NSUInteger const batchSize = 50;
        
        NSUInteger index = 0;
        
        NSMutableString *escaped = @"".mutableCopy;
        
        while (index < self.length)
        {
            NSUInteger length = MIN(self.length - index, batchSize);
            
            NSRange range = NSMakeRange(index, length);
            // To avoid breaking up character sequences such as 👴🏻👮🏽
            range = [self rangeOfComposedCharacterSequencesForRange:range];
            
            NSString *substring = [self substringWithRange:range];
            
            NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
            
            [escaped appendString:encoded];
            
            index += range.length;
        }
        
        return escaped;
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding cfEncoding = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        
        NSString *encoded = (__bridge_transfer NSString *)
        CFURLCreateStringByAddingPercentEscapes(
                                                kCFAllocatorDefault,
                                                (__bridge CFStringRef)self,
                                                NULL,
                                                CFSTR("!#$&'()*+,/:;=?@[]"),
                                                cfEncoding);
        
        return encoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)js_stringByURLDecode
{
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)])
    {
        return [self stringByRemovingPercentEncoding];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        
        NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                            withString:@" "];
        
        decoded = (__bridge_transfer NSString *)
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                NULL,
                                                                (__bridge CFStringRef)decoded,
                                                                CFSTR(""),
                                                                en);
        
        return decoded;
#pragma clang diagnostic pop
    }
}

#pragma mark Drawing
- (CGSize)js_sizeForFont:(UIFont *)font
                    size:(CGSize)size
                    mode:(NSLineBreakMode)lineBreakMode
{
    CGSize result;
    
    if (!font)
    {
        font = [UIFont systemFontOfSize:12];
    }
    
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        
        attr[NSFontAttributeName] = font;
        
        if (lineBreakMode != NSLineBreakByWordWrapping)
        {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            
            paragraphStyle.lineBreakMode = lineBreakMode;
            
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        
        result = rect.size;
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font
                  constrainedToSize:size
                      lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

- (CGFloat)js_widthForFont:(UIFont *)font
{
    CGSize size = [self js_sizeForFont:font
                                  size:CGSizeMake(HUGE, HUGE)
                                  mode:NSLineBreakByWordWrapping];
    
    return size.width;

}

- (CGFloat)js_heightForFont:(UIFont *)font
                      width:(CGFloat)width
{
    CGSize size = [self js_sizeForFont:font
                                  size:CGSizeMake(width, HUGE)
                                  mode:NSLineBreakByWordWrapping];
    
    return size.height;
}

#pragma mark 正则表达式
- (BOOL)js_matchesRegex:(NSString *)regex
                options:(NSRegularExpressionOptions)options
{
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex
                                                                             options:options
                                                                               error:NULL];
    if (!pattern)
    {
        return NO;
    }
    return ([pattern numberOfMatchesInString:self
                                     options:0
                                       range:NSMakeRange(0, self.length)] > 0);
}

#pragma mark NSNumber
- (char)js_charValue
{
    return self.js_numberValue.charValue;
}

- (unsigned char)js_unsignedCharValue
{
    return self.js_numberValue.unsignedCharValue;
}

- (short)js_shortValue
{
    return self.js_numberValue.shortValue;
}

- (unsigned short)js_unsignedShortValue
{
    return self.js_numberValue.unsignedShortValue;
}

- (unsigned int)js_unsignedIntValue
{
    return self.js_numberValue.unsignedIntValue;
}

- (long)js_longValue
{
    return self.js_numberValue.longValue;
}

- (unsigned long)js_unsignedLongValue
{
    return self.js_numberValue.unsignedLongValue;
}

- (unsigned long long)js_unsignedLongLongValue
{
    return self.js_numberValue.unsignedLongLongValue;
}

- (NSUInteger)js_unsignedIntegerValue
{
    return self.js_numberValue.unsignedIntegerValue;
}

#pragma mark Other
+ (NSString *)js_stringWithUUID
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    
    CFRelease(uuid);
    
    return (__bridge_transfer NSString *)string;
}

- (NSString *)js_stringByTrim
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    return [self stringByTrimmingCharactersInSet:set];
}

- (BOOL)js_isNotBlank
{
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    for (NSInteger i = 0; i < self.length; ++i)
    {
        unichar c = [self characterAtIndex:i];
        
        if (![blank characterIsMember:c])
        {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)js_containsString:(NSString *)string
{
    if (string == nil)
    {
        return NO;
    }
    
    return [self rangeOfString:string].location != NSNotFound;
}

- (NSNumber *)js_numberValue
{
    return [NSNumber js_numberWithString:self];
}

- (NSData *)js_dataValue
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSRange)js_rangeOfAll
{
    return NSMakeRange(0, self.length);
}

- (id)js_jsonValueDecoded
{
    return [[self js_dataValue] js_jsonValueDecoded];
}

@end
