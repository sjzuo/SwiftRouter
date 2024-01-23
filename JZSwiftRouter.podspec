
Pod::Spec.new do |s|
  s.name             = 'JZSwiftRouter'
  s.version          = '0.0.4'
  s.summary          = '路由.'
 
  s.description      = <<-DESC
							工具.
                       DESC

  s.homepage         = 'https://gitee.com/sjzLovecj'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sjzLovecj' => '903289738@qq.com' }
  s.source           = { :git => 'https://gitee.com/sjzLovecj/JZSwiftRouter.git', :tag => s.version.to_s }

  s.ios.deployment_target = "13.0"
  s.swift_versions     = ['5.0']
  s.requires_arc = true

  s.frameworks   =  "UIKit" #支持的框架

  s.source_files = 'Sources/SwiftRouter/**/*'
end
