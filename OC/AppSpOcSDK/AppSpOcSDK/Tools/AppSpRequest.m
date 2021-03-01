//
//  AppSpRequest.m
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/2/26.
//
#import "AppSpRequest.h"
#import "AppSpService.h"
#import "AppSpDeviceInfo.h"
#import "AppSpRSACrypt.h"
#import "AppSpConfig.h"

// 请求超时
#define requestTimeOut 10
// 响应超时
#define responseTimeOut 30
// 自定义错误码
#define CustomErrorCode @"604"

@interface AppSpRequest()

@property(nonatomic, copy)NSString *appKey;

@property(nonatomic, strong)NSURLSession *apiSession;

@end

@implementation AppSpRequest

static AppSpRequest *__request;
+ (instancetype)shareRequest {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __request = [[super allocWithZone:NULL] init];
    });
    return __request;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self shareRequest];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        [configuration setHTTPAdditionalHeaders:@{@"Accept": @"application/json"}];
        [configuration setTimeoutIntervalForRequest:requestTimeOut];
        [configuration setTimeoutIntervalForResource:responseTimeOut];
        _apiSession = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

-(void)request:(NSString *)path
    withOption:(nullable NSDictionary *)option
       success:(Success)success
       failure:(Failure)failure {
    NSString *reqUrlStr = [NSString stringWithFormat:@"%@%@", [AppSpService shareService].appSpBaseURL, path];
    
    NSURL *reqUrl = [NSURL URLWithString: reqUrlStr];
    
    if(reqUrl == nil) {
        return;
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:reqUrl];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // 获取appKey
    NSString *appKey = [[AppSpService shareService] getAppKey];
    // 请求使用数据, 先获取设备信息
    NSMutableDictionary *paramData =  [NSMutableDictionary dictionaryWithDictionary:[AppSpDeviceInfo getDeviceInfo]];
    // 拼入appKey
    [paramData setObject:appKey forKey:@"appKey"];
    
    // 请求对象
    NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithDictionary:@{
        @"data": paramData,
        @"sign": @""
    }];
    
    NSString *oriEnStr = [self toEncryptString:paramData];
    if (oriEnStr != nil) {
        [params setObject:[AppSpRSACrypt encryptString:oriEnStr] forKey:@"sign"];
    }
    
    [request setHTTPBody: [self formateRequestBody:params]];
    
    NSURLSessionDataTask *task_post = [_apiSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error != nil) {
            failure([self apiErrorInfo:CustomErrorCode withMessage:error.localizedDescription]);
            return;
        }
        
        if(data == nil) {
            failure([self apiErrorInfo:CustomErrorCode withMessage:@"服务器数据异常"]);
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (!dict) {
            failure([self apiErrorInfo:CustomErrorCode withMessage:@"数据解析异常"]);
            return;
        }
        
        NSString *repMsg = [dict objectForKey:@"repMsg"];
        NSString *repCode = [dict objectForKey:@"repCode"];
        if([repCode isEqualToString:@"0000"]) {
            success(dict);
        }else {
            failure([self apiErrorInfo:repCode withMessage: repMsg == nil ? @"数据异常" : repMsg]);
        }
    }];
    [task_post resume];
}

// 序列化 POST 请求Body数据
-(NSData *)formateRequestBody:(NSDictionary *)data {
    return [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
}

//封装自定义error info
-(NSDictionary *)apiErrorInfo:(NSString *)code withMessage:(NSString *)message {
    return @{
        @"repCode": code,
        @"repMsg": message
    };
}

// 加密前 把字典对象转换成需要加密的字符串
-(NSString *)toEncryptString:(NSDictionary *)data {
    NSData *newData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingFragmentsAllowed error:nil];
    
    return [[NSString alloc]initWithData:newData encoding:NSUTF8StringEncoding];
}

// 解密后字符串转换成字典
-(NSDictionary *)toDecryptDict:(NSString *)encryptedStr {
    NSData *newData = [encryptedStr dataUsingEncoding:NSUTF8StringEncoding];
    if (newData == nil) {
        return nil;
    }
    
    return [NSJSONSerialization JSONObjectWithData:newData options:NSJSONReadingMutableContainers error:nil];
}

@end
