//
//  AppSpRSACrypt.h
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppSpRSACrypt : NSObject
/**
 *
 * 加密
 * originalString 原始字符串
 */
+ (NSString *)encryptString:(NSString *)originalString;

/**
 *
 * 解密
 *
 * ciphertextString 加密字符串
 */
+ (NSString *)decryptString:(NSString *)ciphertextString;
@end

NS_ASSUME_NONNULL_END
