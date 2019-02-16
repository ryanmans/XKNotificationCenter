Pod::Spec.new do |s|
  s.name = "XKNotificationCenter"
  s.version = "1.0.0"
  s.summary = "\u{6d88}\u{606f}\u{4e2d}\u{5fc3},\u{5f02}\u{6b65}\u{4f20}\u{9012}\u{6d88}\u{606f}"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"ryanmans"=>"1696186412@qq.com"}
  s.homepage = "https://github.com/ryanmans/XKNotificationCenter"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/XKNotificationCenter.framework'
end
