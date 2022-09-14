#
# Be sure to run `pod lib lint MembiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'MembSdkiOS'
  spec.version          = '3.1'
  spec.summary          = 'MEMB Library: digital identification with biometry'
  spec.swift_version = '5.0'


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  spec.description      = <<-DESC
This Library is the result of putting together 3 systems of identification.
- Document capture
- Document's NFC Chip validation
- Selfie
With all that information, the Library can assure a valid result for the biometric identification of an user.
                       DESC

  spec.homepage         = 'https://github.com/facephi/MembSdkiOS-podspec'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'jpoveda@facephi.com' => 'jpoveda@facephi.com' }
  spec.source           = { :git => 'https://github.com/facephi/MembSdkiOS-podspec.git', :tag => "#{spec.version}" }

  spec.ios.deployment_target = '13.0'

  spec.ios.frameworks = 'UIKit'
  
  spec.xcconfig = { 'ENABLE_BITCODE' => '"NO' }
  spec.ios.vendored_frameworks = 'MembiOS.xcframework'

  spec.dependency 'lottie-ios'
  spec.dependency 'OpenSSL-Universal', '1.1.1501'
  spec.dependency 'JWTDecode' , '~> 3.0.0'
  spec.dependency 'FPhiSelphIDWidgetiOS'
end