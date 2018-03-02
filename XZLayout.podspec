Pod::Spec.new do |s|
  s.name         = "XZLayout"
  s.version      = "0.0.1"
  s.summary      = "XZLayout"
  s.description  = <<-DESC
					XZLayout description
					DESC
  s.homepage     = "https://github.com/LanceXZH/XZLayout"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "xuzhong" => "xuzhong@meituan.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/LanceXZH/XZLayout.git", :tag => s.version}
  s.source_files  = "Classes", "XZLayout/Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "XZLayout/Classes/**/*.h"
  s.requires_arc = true
end