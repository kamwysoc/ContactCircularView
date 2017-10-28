#
# Be sure to run `pod lib lint ContactCircularView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ContactCircularView'
  s.version          = '1.1.1'
  s.summary          = 'Contact circular view than allows you to represent your friends by initials or image.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
View that allows you to represent people initials (like in Contact book) also it allows you to
put some image instead using initials.

Main inspiration was Contact circular views in iOS Contacts
                       DESC

  s.homepage         = 'https://github.com/kamwysoc/ContactCircularView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kamil Wysocki' => '' }
  s.source           = { :git => 'https://github.com/kamwysoc/ContactCircularView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kamwysoc'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ContactCircularView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ContactCircularView' => ['ContactCircularView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
