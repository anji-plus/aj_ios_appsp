//
//  AppSpService.h
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 成功回调
typedef void (^Success) (NSDictionary *successDic);
// 失败回调
typedef void (^Failure) (NSDictionary *failureDic);

@interface AppSpService : NSObject

// 当前网络连接
@property(nonatomic, copy)NSString *connectionStatus;

// 请求URL
@property(nonatomic, copy)NSString *appSpBaseURL;

// 是否显示log
@property(nonatomic, assign)BOOL isDebug;

/*!
 * @abstract 创建AppSpService服务单例
 */
+ (instancetype)shareService;

/**
 * initConfig 该接口SDK 0.0.3版本支持 增加如下功能；
 * appkey: 移动服务平台创建应用获取
 * debug： 是否显示调试log 默认开启
 * host: 配置自己的host 服务地址 默认nil
 */
-(void)initConfig:(NSString *)appkey withDebug:(BOOL)debug withHost:(nullable NSString *)host;

// 获取版本更新接口
-(void)checkVersionUpdate:(Success)success withFailure:(Failure)failure;

// 获取公告信息接口
-(void)getNoticeInfo:(Success)success withFailure:(Failure)failure;

// 获取appkey 用于请求接口
-(NSString *)getAppKey;


@end

NS_ASSUME_NONNULL_END
