import 'dart:async';

import 'package:flutter/services.dart';

import 'options.dart';

/// The Chinese converter.
class ChineseConverter {
  static const MethodChannel _channel = const MethodChannel('flutter_opencc');
  static List<ConverterOption> _options = [
    S2T(),
    T2S(),
    S2HK(),
    HK2S(),
    S2TW(),
    TW2S(),
    S2TWp(),
    TW2Sp(),
  ];

  /// All available options.
  static List<ConverterOption> get allOptions => _options;

  /// Converter input [text] with a given [option].
  static Future<String> convert(String text, ConverterOption option) async {
    final String result =
        await _channel.invokeMethod('convert', [text, option.id]);
    return result;
  }
}
