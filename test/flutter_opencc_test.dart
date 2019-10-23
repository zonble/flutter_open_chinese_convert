import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_opencc/flutter_opencc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_opencc');

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
