//
//  UIDevice+JSCategory.m
//  JSCategoryDemo
//
//  Created by 菅思博 on 16/12/14.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "UIDevice+JSCategory.h"

#import "NSString+JSCategory.h"

#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <mach/mach.h>
#include <arpa/inet.h>
#include <ifaddrs.h>

@implementation UIDevice (JSCategory)
#pragma mark 设备信息
- (BOOL)js_isPad {
    static dispatch_once_t one;
    
    static BOOL pad;
    
    dispatch_once(&one, ^{
        pad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    });
    
    return pad;
}

- (BOOL)js_isSimulator {
    static dispatch_once_t one;
    
    static BOOL simu;
    
    dispatch_once(&one, ^{
        simu = TARGET_IPHONE_SIMULATOR;
    });
    
    return simu;
}

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
- (BOOL)js_canMakePhoneCalls {
    __block BOOL can;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        can = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
    });
    
    return can;
}
#endif

- (NSString *)js_machineModel {
    static dispatch_once_t one;
    
    static NSString *model;
    
    dispatch_once(&one, ^{
        size_t size;
        
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        
        char *machine = malloc(size);
        
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        
        model = [NSString stringWithUTF8String:machine];
        
        free(machine);
    });
    
    return model;
}

- (NSString *)js_machineModelName {
    static dispatch_once_t one;
    
    static NSString *name;
    
    dispatch_once(&one, ^{
        NSString *model = [self js_machineModel];
        
        if (!model) {
            return;
        }
        
        NSDictionary *dic = @{
                              @"AppleTV2,1" : @"Apple TV 2G",
                              @"AppleTV3,1" : @"Apple TV 3G",
                              @"AppleTV3,2" : @"Apple TV 3G",
                              @"AppleTV5,3" : @"Apple TV 4G",
                              
                              @"Watch1,1" : @"Apple Watch 38mm",
                              @"Watch1,2" : @"Apple Watch 42mm",
                              @"Watch2,6" : @"Apple Watch Series 1 38mm",
                              @"Watch2,7" : @"Apple Watch Series 1 42mm",
                              @"Watch2,3" : @"Apple Watch Series 2 38mm",
                              @"Watch2,4" : @"Apple Watch Series 2 42mm",
                              
                              @"iPad1,1" : @"iPad",
                              @"iPad2,1" : @"iPad 2 (WiFi)",
                              @"iPad2,2" : @"iPad 2 (GSM)",
                              @"iPad2,3" : @"iPad 2 (CDMA)",
                              @"iPad2,4" : @"iPad 2 (WiFi(Rev A))",
                              @"iPad3,1" : @"iPad 3 (WiFi)",
                              @"iPad3,2" : @"iPad 3 (CMDA)",
                              @"iPad3,3" : @"iPad 3 (Global)",
                              @"iPad3,4" : @"iPad 4 (WiFi)",
                              @"iPad3,5" : @"iPad 4 (GSM)",
                              @"iPad3,6" : @"iPad 4 (Global)",
                              @"iPad4,1" : @"iPad Air (WiFi)",
                              @"iPad4,2" : @"iPad Air (LTE)",
                              @"iPad4,3" : @"iPad Air (TD-LTE)",
                              @"iPad5,3" : @"iPad Air 2 (WiFi)",
                              @"iPad5,4" : @"iPad Air 2 (LTE)",
                              @"iPad6,7" : @"iPad Pro (12.9 inch LTE)",
                              @"iPad6,8" : @"iPad Pro (12.9 inch WiFi)",
                              @"iPad6,3" : @"iPad Pro (9.7 inch LTE)",
                              @"iPad6,4" : @"iPad Pro (9.7 inch WiFi)",
                              
                              @"iPad2,5" : @"iPad mini 1 (WiFi)",
                              @"iPad2,6" : @"iPad mini 1 (GSM)",
                              @"iPad2,7" : @"iPad mini 1 (Global)",
                              @"iPad4,4" : @"iPad mini 2 (WiFi)",
                              @"iPad4,5" : @"iPad mini 2 (LTE)",
                              @"iPad4,6" : @"iPad mini 2 (TD-LTE)",
                              @"iPad4,7" : @"iPad mini 3 (WiFi)",
                              @"iPad4,8" : @"iPad mini 3 (WiFi+Cellular)",
                              @"iPad4,9" : @"iPad mini 3 (TD-LTE)",
                              @"iPad5,1" : @"iPad mini 4 (WiFi)",
                              @"iPad5,2" : @"iPad mini 4 (LTE)",

                              @"iPhone1,1" : @"iPhone",
                              @"iPhone1,2" : @"iPhone 3G",
                              @"iPhone2,1" : @"iPhone 3GS",
                              @"iPhone3,1" : @"iPhone 4 (GSM)",
                              @"iPhone3,2" : @"iPhone 4 (GSM (Rev A))",
                              @"iPhone3,3" : @"iPhone 4 (CDMA)",
                              @"iPhone4,1" : @"iPhone 4S",
                              @"iPhone5,1" : @"iPhone 5 (GSM)",
                              @"iPhone5,2" : @"iPhone 5 (GSM+CDMA)",
                              @"iPhone5,3" : @"iPhone 5c (GSM)",
                              @"iPhone5,4" : @"iPhone 5c (GSM+CDMA)",
                              @"iPhone6,1" : @"iPhone 5s (GSM)",
                              @"iPhone6,2" : @"iPhone 5s (GSM+CDMA)",
                              @"iPhone7,2" : @"iPhone 6",
                              @"iPhone7,1" : @"iPhone 6 Plus",
                              @"iPhone8,1" : @"iPhone 6s",
                              @"iPhone8,2" : @"iPhone 6s Plus",
                              @"iPhone8,4" : @"iPhone SE",
                              @"iPhone9,1" : @"iPhone 7",
                              @"iPhone9,3" : @"iPhone 7",
                              @"iPhone9,2" : @"iPhone 7 Plus",
                              @"iPhone9,4" : @"iPhone 7 Plus",

                              @"iPod1,1" : @"iPod touch",
                              @"iPod2,1" : @"iPod touch 2G",
                              @"iPod3,1" : @"iPod touch 3G",
                              @"iPod4,1" : @"iPod touch 4G",
                              @"iPod5,1" : @"iPod touch 5G",
                              @"iPod7,1" : @"iPod touch 6G",
   
                              @"i386" : @"Simulator x86",
                              @"x86_64" : @"Simulator x64",
                              };
        
        name = dic[model];
        
        if (!name) {
            name = model;
        }
    });
    
    return name;
}

- (NSDate *)js_systemUptime {
    NSTimeInterval time = [[NSProcessInfo processInfo] systemUptime];
    
    return [[NSDate alloc] initWithTimeIntervalSinceNow:(0 - time)];
}

+ (double)js_systemVersion {
    static double version;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    
    return version;
}

#pragma mark 网络信息
- (NSString *)js_ipAddressWIFI {
    return [self js_ipAddressWithIfaName:@"en0"];
}

- (NSString *)js_ipAddressCell {
    return [self js_ipAddressWithIfaName:@"pdp_ip0"];
}

- (NSString *)js_ipAddressWithIfaName:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    NSString *address = nil;
    
    struct ifaddrs *addrs = NULL;
    
    if (getifaddrs(&addrs) == 0) {
        struct ifaddrs *addr = addrs;
        
        while (addr) {
            if ([[NSString stringWithUTF8String:addr->ifa_name] isEqualToString:name]) {
                sa_family_t family = addr->ifa_addr->sa_family;
                
                switch (family) {
                        // IPv4
                    case AF_INET: {
                        char str[INET_ADDRSTRLEN] = {0};
                        
                        inet_ntop(family, &(((struct sockaddr_in *)addr->ifa_addr)->sin_addr), str, sizeof(str));
                        
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    }
                        break;
                        // IPv6
                    case AF_INET6: {
                        char str[INET6_ADDRSTRLEN] = {0};
                        
                        inet_ntop(family, &(((struct sockaddr_in6 *)addr->ifa_addr)->sin6_addr), str, sizeof(str));
                        
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    }
                        break;
                    default: {
                        
                    }
                        break;
                }
                
                if (address) {
                    break;
                }
            }
            
            addr = addr->ifa_next;
        }
    }
    
    freeifaddrs(addrs);
    
    return address;
}

typedef struct {
    uint64_t en_in;
    uint64_t en_out;
    uint64_t pdp_ip_in;
    uint64_t pdp_ip_out;
    uint64_t awdl_in;
    uint64_t awdl_out;
} js_net_interface_counter;

static uint64_t js_net_counter_add (uint64_t counter, uint64_t bytes) {
    if (bytes < (counter % 0xFFFFFFFF)) {
        counter += 0xFFFFFFFF - (counter % 0xFFFFFFFF);
        
        counter += bytes;
    }
    else {
        counter = bytes;
    }
    
    return counter;
}

static uint64_t js_net_counter_get_by_type (js_net_interface_counter *counter, JSNetworkTrafficType type) {
    uint64_t bytes = 0;
    
    if (type & JSNetworkTrafficTypeWWANSent) bytes += counter->pdp_ip_out;
    if (type & JSNetworkTrafficTypeWWANReceived) bytes += counter->pdp_ip_in;
    if (type & JSNetworkTrafficTypeWIFISent) bytes += counter->en_out;
    if (type & JSNetworkTrafficTypeWIFIReceived) bytes += counter->en_in;
    if (type & JSNetworkTrafficTypeAWDLSent) bytes += counter->awdl_out;
    if (type & JSNetworkTrafficTypeAWDLReceived) bytes += counter->awdl_in;
    
    return bytes;
}

static js_net_interface_counter js_get_net_interface_counter()
{
    static dispatch_semaphore_t lock;
    
    static NSMutableDictionary *sharedInCounters;
    
    static NSMutableDictionary *sharedOutCounters;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInCounters = [NSMutableDictionary new];
        
        sharedOutCounters = [NSMutableDictionary new];
        
        lock = dispatch_semaphore_create(1);
    });
    
    js_net_interface_counter counter = {0};
    
    struct ifaddrs *addrs;
    
    const struct ifaddrs *cursor;
    
    if (getifaddrs(&addrs) == 0) {
        cursor = addrs;
        
        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
        
        while (cursor) {
            if (cursor->ifa_addr->sa_family == AF_LINK) {
                const struct if_data *data = cursor->ifa_data;
                
                NSString *name = cursor->ifa_name ? [NSString stringWithUTF8String:cursor->ifa_name] : nil;
                
                if (name) {
                    uint64_t counter_in = ((NSNumber *)sharedInCounters[name]).unsignedLongLongValue;
                    
                    counter_in = js_net_counter_add(counter_in, data->ifi_ibytes);
                    
                    sharedInCounters[name] = @(counter_in);
                    
                    uint64_t counter_out = ((NSNumber *)sharedOutCounters[name]).unsignedLongLongValue;
                    
                    counter_out = js_net_counter_add(counter_out, data->ifi_obytes);
                    
                    sharedOutCounters[name] = @(counter_out);
                    
                    if ([name hasPrefix:@"en"]) {
                        counter.en_in += counter_in;
                        
                        counter.en_out += counter_out;
                    }
                    else if ([name hasPrefix:@"awdl"]) {
                        counter.awdl_in += counter_in;
                        
                        counter.awdl_out += counter_out;
                    }
                    else if ([name hasPrefix:@"pdp_ip"]) {
                        counter.pdp_ip_in += counter_in;
                        
                        counter.pdp_ip_out += counter_out;
                    }
                }
            }
            
            cursor = cursor->ifa_next;
        }
        
        dispatch_semaphore_signal(lock);
        
        freeifaddrs(addrs);
    }
    
    return counter;
}

- (uint64_t)js_getNetworkTrafficBytes:(JSNetworkTrafficType)types {
    js_net_interface_counter counter = js_get_net_interface_counter();
    
    return js_net_counter_get_by_type(&counter, types);
}

#pragma mark 磁盘空间
- (int64_t)js_diskSpace {
    NSError *error = nil;
    
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                  error:&error];
    
    if (error) {
        return -1;
    }
    
    int64_t space =  [[attrs objectForKey:NSFileSystemSize] longLongValue];
    
    if (space < 0) {
        space = -1;
    }
    
    return space;
}

- (int64_t)js_diskSpaceFree {
    NSError *error = nil;
    
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                  error:&error];
    
    if (error) {
        return -1;
    }
    
    int64_t space =  [[attrs objectForKey:NSFileSystemFreeSize] longLongValue];
    
    if (space < 0) {
        space = -1;
    }
    
    return space;
}

- (int64_t)js_diskSpaceUsed{
    int64_t total = self.js_diskSpace;
    
    int64_t free = self.js_diskSpaceFree;
    
    if (total < 0 || free < 0) {
        return -1;
    }
    
    int64_t used = total - free;
    
    if (used < 0) {
        used = -1;
    }
    
    return used;
}

#pragma mark 内存信息
- (int64_t)js_memoryTotal {
    int64_t mem = [[NSProcessInfo processInfo] physicalMemory];
    
    if (mem < -1) {
        mem = -1;
    }
    
    return mem;
}

- (int64_t)js_memoryUsed {
    mach_port_t host_port = mach_host_self();
    
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    
    vm_size_t page_size;
    
    vm_statistics_data_t vm_stat;
    
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    return page_size * (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count);
}

- (int64_t)js_memoryFree {
    mach_port_t host_port = mach_host_self();
    
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    
    vm_size_t page_size;
    
    vm_statistics_data_t vm_stat;
    
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    return vm_stat.free_count * page_size;
}

- (int64_t)js_memoryActive {
    mach_port_t host_port = mach_host_self();
    
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    
    vm_size_t page_size;
    
    vm_statistics_data_t vm_stat;
    
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    return vm_stat.active_count * page_size;
}

- (int64_t)js_memoryInactive {
    mach_port_t host_port = mach_host_self();
    
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    
    vm_size_t page_size;
    
    vm_statistics_data_t vm_stat;
    
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    return vm_stat.inactive_count * page_size;
}

- (int64_t)js_memoryWired {
    mach_port_t host_port = mach_host_self();
    
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    
    vm_size_t page_size;
    
    vm_statistics_data_t vm_stat;
    
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    return vm_stat.wire_count * page_size;
}

#pragma mark CPU信息
- (NSUInteger)js_cpuCount {
    return [NSProcessInfo processInfo].activeProcessorCount;
}

- (float)js_cpuUsage {
    float cpu = 0;
    
    NSArray *cpus = [self js_cpuUsagePerProcessor];
    
    if (cpus.count == 0) {
        return -1;
    }
    
    for (NSNumber *n in cpus) {
        cpu += n.floatValue;
    }
    
    return cpu;
}

- (NSArray *)js_cpuUsagePerProcessor {
    processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
    
    mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
    
    unsigned _numCPUs;
    
    NSLock *_cpuUsageLock;
    
    int _mib[2U] = { CTL_HW, HW_NCPU };
    
    size_t _sizeOfNumCPUs = sizeof(_numCPUs);
    
    int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
    
    if (_status) {
        _numCPUs = 1;
    }
    
    _cpuUsageLock = [[NSLock alloc] init];
    
    natural_t _numCPUsU = 0U;
    
    kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
    
    if (err == KERN_SUCCESS) {
        [_cpuUsageLock lock];
        
        NSMutableArray *cpus = [NSMutableArray new];
        
        for (unsigned i = 0U; i < _numCPUs; ++i) {
            Float32 _inUse, _total;
            
            if (_prevCPUInfo) {
                _inUse = (
                          (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE])
                          );
                
                _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
            }
            else {
                _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
                
                _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
            }
            
            [cpus addObject:@(_inUse / _total)];
        }
        
        [_cpuUsageLock unlock];
        
        if (_prevCPUInfo) {
            size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
            
            vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
        }
        
        return cpus;
    }
    else {
        return nil;
    }
}

@end
