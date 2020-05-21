#
# Be sure to run `pod lib lint mfPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mfPicker'
  s.version          = '1.0.0'
  s.summary          = 'A light UIPicker'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  mfPicker is a light UIPicker written in swift
                       DESC

  s.homepage         = 'https://github.com/mohammadFirouzi/mfPicker'
  s.screenshots     = 'https://s7.gifyu.com/images/mfPickerSSH.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohammad Firouzi' => 'mohammad.spz@icloud.com' }
  s.source           = { :git => 'https://github.com/mohammadFirouzi/mfPicker.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Files/Classes/**/*'
  
  # s.resource_bundles = {
  #   'mfPicker' => ['mfPicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
