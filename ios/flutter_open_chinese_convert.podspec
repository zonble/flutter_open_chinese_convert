#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_open_chinese_convert.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_open_chinese_convert'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description = <<-DESC
flutter_open_chinese_convert bridges OpenCC (Open Chinese Convert) to your
Flutter projects. You can use the package to convert Traditional Chinese to
Simplified Chinese, and vise versa.

The package supports various conversion options:

- S2T: Simplified Chinese to Traditional Chinese.
- T2S: Traditional Chinese to Simplified Chinese.
- S2HK: Simplified Chinese to Traditional Chinese (Hong Kong Standard).
- HK2S: Traditional Chinese (Hong Kong Standard) to Simplified Chinese.
- S2TW: Simplified Chinese to Traditional Chinese (Taiwan Standard).
- TW2S: Traditional Chinese (Taiwan Standard) to Simplified Chinese.
- S2TWp: Simplified Chinese to Traditional Chinese (Taiwan Standard) with Taiwanese idiom.
- TW2Sp: Traditional Chinese (Taiwan Standard) to Simplified Chinese with Mainland Chinese idiom.
                       DESC
  s.homepage         = 'http://example.com'
  s.license = { :file => "../LICENSE" }
  s.author = { "Weizhong Yang a.k.a zonble" => "zonble@gmail.com" }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_open_chinese_convert/Sources/flutter_open_chinese_convert/**/*'
  s.dependency "Flutter"
  s.dependency "OpenCC"
  s.xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(PODS_ROOT)/OpenCC/SwiftOpenCC/Sources/OpenCCBridge/include",
    "OTHER_CFLAGS" => "-fembed-bitcode",
  }
  s.ios.deployment_target = "12.0"

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'flutter_open_chinese_convert_privacy' => ['flutter_open_chinese_convert/Sources/flutter_open_chinese_convert/PrivacyInfo.xcprivacy']}
end
