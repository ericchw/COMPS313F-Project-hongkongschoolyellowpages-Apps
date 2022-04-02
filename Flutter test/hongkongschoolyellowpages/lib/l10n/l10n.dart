import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale.fromSubtags(
        languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
    const Locale.fromSubtags(
        languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
    const Locale('en'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'zh':
        return '中文';
      case 'en':
        return 'English';
      default:
        return '中文';
    }
  }
}
