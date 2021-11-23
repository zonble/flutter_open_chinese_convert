Pod::Spec.new do |s|
  s.name = "flutter_open_chinese_convert"
  s.version = "0.1.0"
  s.summary = "flutter_open_chinese_convert bridges OpenCC (Open Chinese Convert, 開放中文轉換) to your Flutter projects."
  s.description = <<-DESC
flutter_open_chinese_convert bridges OpenCC (Open Chinese Convert, 開放中文轉換) to your
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
  s.homepage = "https://github.com/zonble/flutter_open_chinese_convert"
  s.license = { :file => "../LICENSE" }
  s.author = { "Weizhong Yang a.k.a zonble" => "zonble@gmail.com" }
  s.source = { :path => "." }
  s.swift_versions = ['4.0', '4.2', '5.0', '5.1', "5.5"]
  s.source_files = "Classes/**/*"
  s.public_header_files = "Classes/**/*.h"
  s.dependency "Flutter"
  s.dependency "OpenCC"
  s.xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(PODS_ROOT)/OpenCC/SwiftOpenCC/Sources/OpenCCBridge/include",
    "OTHER_CFLAGS" => "-fembed-bitcode",
  }
  s.ios.deployment_target = "8.0"
end
