Pod::Spec.new do |s|
  s.name             = "LTJelloSwitch"
  s.version          = "0.1.0"
  s.summary          = "A rapid prototype built with Swift and PaintCode."
  s.homepage         = "https://github.com/lexrus/LTJelloSwitch"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Lex Tang" => "lexrus@gmail.com" }
  s.source           = { :git => "https://github.com/lexrus/LTJelloSwitch.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lexrus'

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.swift'

  s.frameworks = 'UIKit', 'QuartzCore'
end
