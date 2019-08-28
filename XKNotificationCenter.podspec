#
# Be sure to run `pod lib lint XKNotificationCenter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XKNotificationCenter'
  s.version          = '2.2.0'
  s.summary          = '消息中心,异步传递消息'
  s.homepage         = 'https://github.com/ryanmans/XKNotificationCenter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ryanmans' => '1696186412@qq.com' }
  s.source           = { :git => 'https://github.com/ryanmans/XKNotificationCenter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'XKNotificationCenter/Classes/**/*'
 # s.ios.vendored_frameworks = 'XKNotificationCenter/Classes/XKNotificationCenter.framework'
end
