//
//  AppSpRequest.h
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

@interface AppSpRequest : NSObject

/*!
 * @abstract 创建AppSpRequest服务单例
 */
+ (instancetype)shareRequest;

-(void)request:(NSString *)path
    withOption:(nullable NSDictionary *)option
       success:(Success)success
       failure:(Failure)failure;

@end

NS_ASSUME_NONNULL_END
