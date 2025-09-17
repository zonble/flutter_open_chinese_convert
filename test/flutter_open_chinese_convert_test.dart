import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert_platform_interface.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterOpenChineseConvertPlatform
    with MockPlatformInterfaceMixin
    implements FlutterOpenChineseConvertPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterOpenChineseConvertPlatform initialPlatform =
      FlutterOpenChineseConvertPlatform.instance;

  test('$MethodChannelFlutterOpenChineseConvert is the default instance', () {
    expect(initialPlatform,
        isInstanceOf<MethodChannelFlutterOpenChineseConvert>());
  });

  test('getPlatformVersion', () async {
    FlutterOpenChineseConvert flutterOpenChineseConvertPlugin =
        FlutterOpenChineseConvert();
    MockFlutterOpenChineseConvertPlatform fakePlatform =
        MockFlutterOpenChineseConvertPlatform();
    FlutterOpenChineseConvertPlatform.instance = fakePlatform;

    expect(await flutterOpenChineseConvertPlugin.getPlatformVersion(), '42');
  });
}
