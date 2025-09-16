import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_open_chinese_convert_platform_interface.dart';

/// An implementation of [FlutterOpenChineseConvertPlatform] that uses method channels.
class MethodChannelFlutterOpenChineseConvert extends FlutterOpenChineseConvertPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_open_chinese_convert');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
