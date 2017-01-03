//
//  UIApplication+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "UIApplication+JSCategory.h"

@implementation UIApplication (JSCategory)
#pragma mark 组件属性
- (NSURL *)js_documentsURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)js_documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)js_cachesURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)js_cachesPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)js_libraryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

- (NSString *)js_libraryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)js_appBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)js_appBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)js_appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)js_appBuildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

@end
