#
# Be sure to run `pod lib lint MembiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MembSdkiOS'
  spec.version          = '1.0.0'
  s.summary          = 'A short description of MembSdkiOS.'
  s.swift_version = '5.0'


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jpoveda@facephi.com/memb-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jpoveda@facephi.com' => 'jpoveda@facephi.com' }
  s.source           = { :git => 'https://github.com/facephi/MembSdkiOS-podspec.git', :tag => "#{spec.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.static_framework = false

  s.resource_bundles = {
      'MembiOS' => ["MembiOS/Resources/**/*.{xcassets,strings,OTF,json,pem}","MembiOS/UI/**/*.xib"]
  }

  s.ios.frameworks = 'UIKit'


  # Removed architecture for simulator
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 i386' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 i386' }
  s.xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 i386' }

  # Removed architecture for device
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS' => 'armv7' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS' => 'armv7' }

  
  s.xcconfig = { 'ENABLE_BITCODE' => '"NO' }
  s.ios.vendored_frameworks = "MembiOS.xcframework"

  s.dependency 'lottie-ios', '~> 3.3.0'
  s.dependency 'FPhiNFCiOS', '~> 1.0.0'
  s.dependency 'FPhiApiManager' , '~> 1.0.0'
  s.dependency 'FPhiSelphIDWidgetiOS', '~> 1.12.1'
end
