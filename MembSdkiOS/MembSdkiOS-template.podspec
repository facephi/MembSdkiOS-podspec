#
# Be sure to run `pod lib lint MembiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'MembSdkiOS'
  spec.version          = '$VERSION_RELEASE'
  spec.summary          = 'A short description of MembSdkiOS.'
  spec.swift_version = '5.0'


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  spec.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  spec.homepage         = 'https://github.com/jpoveda@facephi.com/memb-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'jpoveda@facephi.com' => 'jpoveda@facephi.com' }
  spec.source           = { :git => 'https://github.com/facephi/MembSdkiOS-podspec.git', :tag => "#{spec.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  spec.ios.deployment_target = '13.0'
  
   spec.resource_bundles = {
       'MembiOS' => ["MembiOS/Resources/**/*.{xcassets,strings,OTF,json,pem}","MembiOS/UI/**/*.xib"]
   }

  spec.ios.frameworks = 'UIKit'
  
  spec.xcconfig = { 'ENABLE_BITCODE' => '"NO' }
  spec.ios.vendored_frameworks = 'MembiOS.xcframework'

  spec.dependency 'lottie-ios', '~> 3.3.0'
  spec.dependency 'FPhiNFCiOS', '~> 1.0.0'
  spec.dependency 'FPhiApiManager' , '~> 1.0.0'
  spec.dependency 'FPhiSelphIDWidgetiOS', '~> 1.12.1'
end
