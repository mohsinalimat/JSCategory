//
//  UIDevice+JSCategory.h
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (JSCategory)
#pragma mark 设备信息
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

#pragma mark 网络信息
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

#pragma mark 磁盘空间
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


#pragma mark 内存信息
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

#pragma mark CPU信息
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

@end

NS_ASSUME_NONNULL_END
