//
//  DeviceInfo.h
//  AJPushSDK
//
//  Created by Black on 2021/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppSpDeviceInfo : NSObject
// 初始化设备信息接口
+ (void)deviceInit;
// 直接返回接口请求的基础参数字典
+ (NSDictionary *)getDeviceInfo;

// 获取系统型号
+ (NSString *)getOSVerison;
// 获取UUID
+ (NSString *)getDeviceId;
// 获取系统平台
+ (NSString *)getPlatform;
// 获取屏幕宽高
+ (NSString *)getScreenInfo;
// 获取版本号
+ (NSString *)getAppBuildCode;
// 获取版本名
+ (NSString *)getAppVersion;
// 获取设备型号
+ (NSString *)getBrandInfo;
@end

NS_ASSUME_NONNULL_END
