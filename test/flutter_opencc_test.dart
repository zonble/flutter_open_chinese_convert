import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_open_chinese_convert');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('convert', () async {
    WidgetsFlutterBinding.ensureInitialized();
    expect(await ChineseConverter.convert('1224', HK2S()), '42');
  });
}
