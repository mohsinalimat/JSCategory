Pod::Spec.new do |s|
  s.name             = 'JSCategory'
  s.version          = '1.2.0'
  s.summary          = 'JSCategory：常用类别集合'
  s.homepage         = 'https://github.com/spirit-jsb/JSCategory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '菅思博' => 'spirit1437419996@163.com' }
  s.source           = { :git => 'https://github.com/spirit-jsb/JSCategory.git', :tag => s.version.to_s }

  s.platform     = :ios, "8.0"

  s.source_files = 'JSCategory/Classes/**/*.{h,m}'

  s.libraries = 'z'
  s.frameworks = 'UIKit', 'CoreFoundation' ,'QuartzCore', 'CoreGraphics', 'CoreImage', 'CoreText', 'ImageIO', 'Accelerate'

end
