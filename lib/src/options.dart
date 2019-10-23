/// Represents an option for [ChineseConverter].
abstract class ConverterOption {
  /// ID of the option.
  String get id;

  /// Description in English.
  String get englishDescription;

  /// Description in Chinese.
  String get chineseDescription;
}

/// Simplified Chinese to Traditional Chinese.
class S2T implements ConverterOption {
  @override
  String get chineseDescription => '簡體到繁體';

  @override
  String get englishDescription => 'Simplified Chinese to Traditional Chinese';

  @override
  String get id => 's2t';
}

/// Traditional Chinese to Simplified Chinese.
class T2S implements ConverterOption {
  @override
  String get chineseDescription => '繁體到簡體';

  @override
  String get englishDescription => 'Traditional Chinese to Simplified Chinese';

  @override
  String get id => 't2s';
}

/// Simplified Chinese to Traditional Chinese (Hong Kong Standard).
class S2HK implements ConverterOption {
  @override
  String get chineseDescription => '簡體到香港繁體（香港小學學習字詞表標準）';

  @override
  String get englishDescription =>
      'Simplified Chinese to Traditional Chinese (Hong Kong Standard)';

  @override
  String get id => 's2hk';
}

/// Traditional Chinese (Hong Kong Standard) to Simplified Chinese.
class HK2S implements ConverterOption {
  @override
  String get chineseDescription => '香港繁體（香港小學學習字詞表標準）到簡體';

  @override
  String get englishDescription =>
      'Traditional Chinese (Hong Kong Standard) to Simplified Chinese';

  @override
  String get id => 'hk2s';
}

/// Simplified Chinese to Traditional Chinese (Taiwan Standard).
class S2TW implements ConverterOption {
  @override
  String get chineseDescription => '簡體到臺灣正體';

  @override
  String get englishDescription =>
      'Simplified Chinese to Traditional Chinese (Taiwan Standard)';

  @override
  String get id => 's2tw';
}

/// Traditional Chinese (Taiwan Standard) to Simplified Chinese.
class TW2S implements ConverterOption {
  @override
  String get chineseDescription => '臺灣正體到簡體';

  @override
  String get englishDescription =>
      'Traditional Chinese (Taiwan Standard) to Simplified Chinese';

  @override
  String get id => 'tw2s';
}

/// Simplified Chinese to Traditional Chinese (Taiwan Standard) with Taiwanese idiom.
class S2TWp implements ConverterOption {
  @override
  String get chineseDescription => '簡體到繁體（臺灣正體標準）並轉換爲臺灣常用詞彙';

  @override
  String get englishDescription =>
      'Simplified Chinese to Traditional Chinese (Taiwan Standard) with Taiwanese idiom';

  @override
  String get id => 's2twp';
}

/// Traditional Chinese (Taiwan Standard) to Simplified Chinese with Mainland Chinese idiom.
class TW2Sp implements ConverterOption {
  @override
  String get chineseDescription => '繁體（臺灣正體標準）到簡體並轉換爲中國大陸常用詞彙';

  @override
  String get englishDescription =>
      'Traditional Chinese (Taiwan Standard) to Simplified Chinese with Mainland Chinese idiom';

  @override
  String get id => 'tw2sp';
}
