#
# Be sure to run `pod lib lint ComponentMediator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ComponentMediator'
  s.version          = '1.0.0'
  s.summary          = '组件化之中间件'

  s.description      = 'ComponentMediator，这其中包含URL-Block、URL-Protocol、CTMediator三种通信方式'

  s.homepage         = 'https://github.com/DreamcoffeeZS/ComponentMediator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhoushuai' => 'fengzi@micous.com' }
  s.source           = { :git => 'https://github.com/dreamcoffeeZS/ComponentMediator.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  
  # s.resource_bundles = {
  #   'ComponentMediator' => ['ComponentMediator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  
  
  s.subspec 'Mediator' do |ss|
    ss.source_files = 'ComponentMediator/Classes/Mediator/**/*'
    ss.dependency 'CTMediator'
  end
  
  s.subspec 'RouterBlock' do |ss|
    ss.source_files = 'ComponentMediator/Classes/RouterBlock/*'
    ss.dependency 'MGJRouter', '~> 0.9.0'
  end
  
  s.subspec 'RouterProtocol' do |ss|
    ss.source_files = 'ComponentMediator/Classes/RouterProtocol/*'
  end
  
end
