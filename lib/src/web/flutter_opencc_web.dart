import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert_platform_interface.dart';
import 'package:web/web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class FlutterOpenccWeb extends FlutterOpenChineseConvertPlatform {
  FlutterOpenccWeb();

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
        "flutter_open_chinese_convert", const StandardMethodCodec(), registrar);
    final FlutterOpenccWeb instance = FlutterOpenccWeb();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'convert':
        return _convert(
          call.arguments["text"],
          call.arguments["option"]
        );
    }
  }

  Future<String> _convert(String text, ConverterOption option) async {
    return text;
  }
}
