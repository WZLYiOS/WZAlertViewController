#
# Be sure to run `pod lib lint WZAlertViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WZAlertViewController'
  s.version          = '2.2.0'
  s.summary          = '方便快捷的弹出框.'


  s.description      = <<-DESC
方便快捷的弹出框.
                       DESC

  s.homepage         = 'https://github.com/WZLYiOS/WZAlertViewController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuxiaobin' => '327847390@qq.com' }
  s.source           = { :git => 'https://github.com/WZLYiOS/WZAlertViewController.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.static_framework = true
  s.swift_version         = '5.0'
  s.ios.deployment_target = '9.0'
  s.default_subspec = 'Source'
  
  s.subspec 'Source' do |ss|
    ss.source_files = 'WZAlertViewController/Classes/*.swift'
  end


  s.subspec 'Binary' do |ss|
    ss.vendored_frameworks = "Carthage/Build/iOS/Static/WZAlertViewController.framework"
    ss.user_target_xcconfig = { 'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)' }
  end
end
