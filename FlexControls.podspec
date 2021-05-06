Pod::Spec.new do |s|
  s.name             = 'FlexControls'
  s.version          = '1.0.2'
  s.license          = 'MIT'
  s.summary          = 'Flexible base components with style'
  s.homepage         = 'https://github.com/mjrehder/FlexControls.git'
  s.authors          = { 'Martin Jacob Rehder' => 'gitrepocon01@rehsco.com' }
  s.source           = { :git => 'https://github.com/mjrehder/FlexControls.git', :tag => s.version }
  s.swift_version    = '5.0'
  s.ios.deployment_target = '12.0'

  s.dependency 'StyledLabel'

  s.framework    = 'UIKit'
  s.source_files = 'FlexControls/**/*.swift'
  s.requires_arc = true
end
