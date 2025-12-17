@JS('OpenCC')
library flutter_open_chinese_convert;

import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert_platform_interface.dart';
import 'package:flutter_open_chinese_convert/src/web/option_pair.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart';

@JS()
external JSFunction Converter(JSAny? options);

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
          call.arguments[0], //text
          call.arguments[1] //option
        );
    }
  }

  Future<String> _convert(String text, String option) async {
    await loadLibrary();
    OptionPair options = OptionPair.optionMap[option]!;
    JSFunction converterInstance = Converter({
      "to":  options.to,
      "from": options.from
    }.jsify());
    JSAny? result = converterInstance.callAsFunction(
        null,
        text.toJS
    );
    return (result as JSString).toDart;
  }

  Future<void> loadLibrary() async {
    final String scriptId = 'flutter-open-chinese-convert';
    if(document.querySelector('script#$scriptId') != null) {
      return;
    }

    final scriptUrl = "https://cdn.jsdelivr.net/npm/opencc-js@1.0.5/dist/umd/full.js";
    final completer = Completer<void>();

    final script =
    HTMLScriptElement()
      ..id = scriptId
      ..async = true
      ..defer = false
      ..type = 'application/javascript'
      ..lang = 'javascript'
      ..crossOrigin = 'anonymous'
      ..src = scriptUrl
      ..onload =
              (JSAny _) {
            if (!completer.isCompleted) {
              completer.complete();
            }
          }.toJS;

    document.head!.appendChild(script);
    await completer.future;
  }

}
