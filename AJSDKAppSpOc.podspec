Pod::Spec.new do |s|
    s.name         = 'AJSDKAppSpOc'
    s.version      = '0.0.4'
    s.summary      = 'ios AJSDKAppSp versionUpdate Notice By Objective-C'
    s.homepage     = 'https://github.com/anji-plus/aj_ios_appsp/OC'
    s.license      = 'MIT'
    s.authors      = {'LiJiabin-AJ' => 'lijiabin@anji-plus.com'}
    s.platform     = :ios, '9.0'
    s.source       = {:git => 'https://gitee.com/littleandy/app-sp-sdk-oc.git', :tag => s.version}
    s.requires_arc = true
    s.source_files = 'OC/AppSpOcSDK/AppSpOcSDK/**/*.{h,m}'
    s.static_framework = true
end
