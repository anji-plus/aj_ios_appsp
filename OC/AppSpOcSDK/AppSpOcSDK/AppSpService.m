//
//  AppSpService.m
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/2/26.
//

#import "AppSpService.h"
#import "AJAppSpReachability.h"
#import "AppSpDeviceInfo.h"
#import "AppSpVersion.h"
#import "AppSpNotice.h"

@interface AppSpService()

// appKey
@property(nonatomic, copy)NSString *appKey;
// 网络检测
@property(nonatomic, strong)AJAppSpReachability *reachability;

@end

@implementation AppSpService
static AppSpService *__service;
+ (instancetype)shareService {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __service = [[super allocWithZone:NULL] init];
        __service.reachability = [AJAppSpReachability reachabilityWithHostname:@"www.baidu.com"];
        __service.connectionStatus = @"WIFI";
        __service.appSpBaseURL = @"https://appsp.anji-plus.com";
        __service.isDebug = YES;
        
        __service.reachability.reachableBlock = ^(AJAppSpReachability *reach){
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"REACHABLE!");
            });
        };
        
        __service.reachability.unreachableBlock = ^(AJAppSpReachability *reach){
            NSLog(@"UNREACHABLE!");
        };
        
        [__service.reachability startNotifier];
    });
    return __service;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self shareService];
}

/**
 * initConfig 该接口SDK 0.0.3版本支持 增加如下功能；
 * appkey: 移动服务平台创建应用获取
 * debug： 是否显示调试log 默认开启
 * host: 配置自己的host 服务地址 默认nil
 */
-(void)initConfig:(NSString *)key withDebug:(BOOL)debug withHost:(nullable NSString *)host {
    self.isDebug = debug;
    if(host != nil) {
        self.appSpBaseURL = host;
    }
    _appKey = key;
    [self deviceInit];
}

// 获取版本更新接口
-(void)checkVersionUpdate:(Success)success withFailure:(Failure)failure {
    [AppSpVersion checkVersionUpdate:success withFailure:failure];
}

// 获取公告信息接口
-(void)getNoticeInfo:(Success)success withFailure:(Failure)failure {
    [AppSpNotice getNotice:success withFailure:failure];
}

// 初始化设备信息
-(void)deviceInit {
    [AppSpDeviceInfo deviceInit];
}

// 获取appkey 用于请求接口
-(NSString *)getAppKey {
    return _appKey == nil ? @"" : _appKey;
}

- (void)dealloc {
    [_reachability stopNotifier];
}

@end
