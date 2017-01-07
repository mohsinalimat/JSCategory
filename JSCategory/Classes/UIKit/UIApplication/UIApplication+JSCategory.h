//
//  UIApplication+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (JSCategory)
#pragma mark 组件属性
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

@end

NS_ASSUME_NONNULL_END
