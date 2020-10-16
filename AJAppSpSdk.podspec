Pod::Spec.new do |s|
    s.name         = 'AJAppSpSdk'
    s.version      = '0.0.3'
    s.summary      = 'ios AppSpSDK versionUpdate Notice'
    s.homepage     = 'https://gitee.com/xuzhanqiang/ajapp-sp'
    s.license      = 'MIT'
    s.authors      = {'blackxu' => '747373635@qq.com'}
    s.platform     = :ios, '9.0'
    s.source       = {:git => 'https://gitee.com/xuzhanqiang/ajapp-sp.git', :tag => s.version}
    s.requires_arc = true
    s.swift_version = '4.0'
    s.source_files = 'AppSpSDK/AppSpSDK/**/*.swift'
end
