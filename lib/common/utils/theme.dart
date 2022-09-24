import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_starter/common/constants/style.dart';
import 'package:flutter_starter/common/utils/utils.dart';

class UtilTheme {
  static StreamSubscription<dynamic>? _subscription;

  static void setSystemNavigationBar(ThemeMode mode) {
    _subscription?.cancel();
    _subscription =
        Stream.value(1).delay(const Duration(milliseconds: 200)).listen((_) {
      bool isDark = false;
      if (mode == ThemeMode.dark ||
          (mode == ThemeMode.system &&
              window.platformBrightness == Brightness.dark)) {
        isDark = true;
      }
      setSystemBarStyle(isDark: isDark);
    });
  }

  static void setSystemBarStyle({
    bool? isDark,
  }) {
    if (UtilDevice.isAndroid) {
      final bool isDarkMode =
          isDark ?? window.platformBrightness == Brightness.dark;
      final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            isDarkMode ? ConstantColor.darkBg : Colors.white,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color? getDarkColor(BuildContext context, Color darkColor) {
    return isDark(context) ? darkColor : null;
  }

  static Color? getIconColor(BuildContext context) {
    return isDark(context) ? ConstantColor.darkTextPrimary : null;
  }
}

extension ThemeExtension on BuildContext {
  bool get isDark => UtilTheme.isDark(this);
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get dialogBackgroundColor => Theme.of(this).canvasColor;
}
