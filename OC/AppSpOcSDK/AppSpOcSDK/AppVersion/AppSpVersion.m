//
//  AppSpVersion.m
//  AppSpOcSDK
//
//  Created by 李家斌 on 2021/2/26.
//

#import "AppSpVersion.h"
#import "AppSpRequest.h"
#import "AppSpConfig.h"

@implementation AppSpVersion

+(void)checkVersionUpdate:(Success)success withFailure:(Failure)failure; {
    [[AppSpRequest shareRequest] request:[AppSpConfig getVersionPath] withOption:nil success:success failure:failure];
}

@end
