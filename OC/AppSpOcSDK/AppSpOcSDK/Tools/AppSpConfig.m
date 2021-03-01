//
//  AppSpConfig.m
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/3/1.
//

#import "AppSpConfig.h"

@implementation AppSpConfig

// 获取SDK版本号
+ (NSString *)getSdkVersion {
    return @"0.0.1";
}

// 获取公告路由
+ (NSString *)getNoticePath {
    return @"/sp/phone/appNotice";
}

// 获取版本更新路由
+ (NSString *)getVersionPath {
    return @"/sp/phone/appVersion";
}

// 设备初始化路由
+ (NSString *)getDeviceInfoPath {
    return @"/sp/phone/deviceInit";
}

// 前端本地保存数据加密 - 公钥
+ (NSString *)getRsaPublicKey {
    return @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDf2XdSpvtuC1xeRzP8VOhoF4CRrfOk0ZbxlYniauPWmQqNeDP1IMqoXyJ72FEmmFh6crNSKdGwqyy9ifRuiCPbQ0UhKMsOe7F/06FECoUH3NYipVIHgY4KYpHrIYo9uw8xTCWjUh9iz3Kv5yhulzHR+ORpNQ460xTki57yd6LA/wIDAQAB";
}

// 前端本地保存数据加密 - 私钥
+ (NSString *)getRsaPrivateKey {
    return @"本地不保存私钥";
}

@end
