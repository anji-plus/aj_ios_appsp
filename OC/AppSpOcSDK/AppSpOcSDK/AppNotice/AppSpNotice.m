//
//  AppSpNotice.m
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/2/26.
//

#import "AppSpNotice.h"
#import "AppSpRequest.h"
#import "AppSpConfig.h"

@implementation AppSpNotice

+(void)getNotice:(Success)success withFailure:(Failure)failure {
    [[AppSpRequest shareRequest] request:[AppSpConfig getNoticePath] withOption:nil success:success failure:failure];
}

@end
