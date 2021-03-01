//
//  AppSpConfig.h
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppSpConfig : NSObject

// 获取SDK版本号
+ (NSString *)getSdkVersion;

// 获取公告路由
+ (NSString *)getNoticePath;

// 获取版本更新路由
+ (NSString *)getVersionPath;

// 设备初始化路由
+ (NSString *)getDeviceInfoPath;

// 前端本地保存数据加密 - 公钥
+ (NSString *)getRsaPublicKey;

// 前端本地保存数据加密 - 私钥
+ (NSString *)getRsaPrivateKey;

@end

NS_ASSUME_NONNULL_END
