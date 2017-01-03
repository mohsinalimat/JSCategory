//
//  NSArray+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 17/1/3.
//  Copyright © 2017年 菅思博. All rights reserved.
//

#import "NSArray+JSCategory.h"

#import "NSData+JSCategory.h"

@implementation NSArray (JSCategory)
#pragma mark 组件方法
+ (NSArray *)js_arrayWithPlistData:(NSData *)plist {
    if (!plist) {
        return nil;
    }
    
    NSArray *array = [NSPropertyListSerialization propertyListWithData:plist
                                                               options:NSPropertyListImmutable
                                                                format:NULL
                                                                 error:NULL];
    
    if ([array isKindOfClass:[NSArray class]]) {
        return array;
    }
    
    return nil;
}

+ (NSArray *)js_arrayWithPlistString:(NSString *)plist {
    if (!plist) {
        return nil;
    }
    
    NSData* data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    
    return [self js_arrayWithPlistData:data];
}

- (NSData *)js_plistData {
    return [NSPropertyListSerialization dataWithPropertyList:self
                                                      format:NSPropertyListBinaryFormat_v1_0
                                                     options:kNilOptions
                                                       error:NULL];
}

- (NSString *)js_plistString {
    NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:self
                                                                 format:NSPropertyListXMLFormat_v1_0
                                                                options:kNilOptions
                                                                  error:NULL];
    
    if (xmlData) {
        return xmlData.js_utf8String;
    }
    
    return nil;
}

- (id)js_randomObject {
    if (self.count) {
        return self[arc4random_uniform((u_int32_t)self.count)];
    }
    
    return nil;
}

- (id)js_objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

- (NSString *)js_jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:0
                                                             error:&error];
        
        NSString *json = [[NSString alloc] initWithData:jsonData
                                               encoding:NSUTF8StringEncoding];
        
        return json;
    }
    
    return nil;
}

- (NSString *)js_jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        
        NSString *json = [[NSString alloc] initWithData:jsonData
                                               encoding:NSUTF8StringEncoding];
        
        return json;
    }
    return nil;
}

@end

@implementation NSMutableArray (JSCategory)
#pragma mark 组件方法
+ (NSMutableArray *)js_arrayWithPlistData:(NSData *)plist {
    if (!plist) {
        return nil;
    }
    
    NSMutableArray *array = [NSPropertyListSerialization propertyListWithData:plist
                                                                      options:NSPropertyListMutableContainersAndLeaves
                                                                       format:NULL
                                                                        error:NULL];
    
    if ([array isKindOfClass:[NSMutableArray class]]) {
        return array;
    }
    
    return nil;
}

+ (NSMutableArray *)js_arrayWithPlistString:(NSString *)plist {
    if (!plist) {
        return nil;
    }
    
    NSData* data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    
    return [self js_arrayWithPlistData:data];
}

- (void)js_removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)js_removeLastObject {
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
}

#pragma clang diagnostic pop

- (id)js_popFirstObject {
    id obj = nil;
    
    if (self.count) {
        obj = self.firstObject;
        
        [self js_removeFirstObject];
    }
    
    return obj;
}

- (id)js_popLastObject {
    id obj = nil;
    
    if (self.count) {
        obj = self.lastObject;
        
        [self js_removeLastObject];
    }
    
    return obj;
}

- (void)js_appendObject:(id)anObject {
    [self addObject:anObject];
}

- (void)js_prependObject:(id)anObject {
    [self insertObject:anObject
               atIndex:0];
}

- (void)js_appendObjects:(NSArray *)objects {
    if (!objects) {
        return;
    }
    
    [self addObjectsFromArray:objects];
}

- (void)js_prependObjects:(NSArray *)objects {
    if (!objects) {
        return;
    }
    
    NSUInteger i = 0;
    
    for (id obj in objects) {
        [self insertObject:obj
                   atIndex:i++];
    }
}

- (void)js_insertObjects:(NSArray *)objects
                 atIndex:(NSUInteger)index {
    NSUInteger i = index;
    
    for (id obj in objects) {
        [self insertObject:obj
                   atIndex:i++];
    }
}

- (void)js_reverse {
    NSUInteger count = self.count;
    
    int mid = floor(count / 2.0);
    
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:(count - (i + 1))];
    }
}

- (void)js_shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}

@end
