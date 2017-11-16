Pod::Spec.new do |s|
  s.name             = 'ZProgressCircle'
  s.version          = '1.0.0'
  s.summary          = 'Light, well-designed and easy to use progress circle for iOS apps'

  s.description      = <<-DESC
Light, well-designed and easy to use progress circle for iOS apps
As simple as a drag and drop in the storyboard
                       DESC

  s.homepage         = 'https://github.com/soucolline/ZProgressCircle'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'soucolline' => 'guilleminot.thomas@gmail.com' }
  s.source           = { :git => 'https://github.com/soucolline/ZProgressCircle.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mrsoucolline'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ZProgressCircle/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZProgressCircle' => ['ZProgressCircle/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
