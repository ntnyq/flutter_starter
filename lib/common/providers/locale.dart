import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_starter/common/constants/constants.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? get locale {
    final String locale = SpUtil.getString(ConstantStorage.localeKey) ?? '';
    switch (locale) {
      case 'zh':
        return const Locale('zh', 'CN');
      case 'en':
        return const Locale('en', 'US');
      default:
        return null;
    }
  }

  void setLocale(String locale) {
    SpUtil.putString(ConstantStorage.localeKey, locale);
    notifyListeners();
  }
}
