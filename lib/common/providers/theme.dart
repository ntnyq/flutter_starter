import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_starter/common/constants/constants.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

class ThemeProvider extends ChangeNotifier {
  void syncTheme() {
    final String theme = SpUtil.getString(ConstantStorage.themeKey) ?? '';

    if (theme.isNotEmpty && theme != ThemeMode.system.value) {
      notifyListeners();
    }
  }

  void setTheme(ThemeMode themeMode) {
    SpUtil.putString(ConstantStorage.themeKey, themeMode.value);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    final String theme = SpUtil.getString(ConstantStorage.themeKey) ?? '';

    switch (theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  ThemeData getTheme({
    bool isDarkMode = false,
  }) {
    return ThemeData(
      errorColor: isDarkMode ? ConstantColor.darkRed : Colors.red,
      primaryColor:
          isDarkMode ? ConstantColor.darkPrimary : ConstantColor.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        secondary:
            isDarkMode ? ConstantColor.darkPrimary : ConstantColor.primary,
      ),
      indicatorColor:
          isDarkMode ? ConstantColor.darkPrimary : ConstantColor.primary,
      scaffoldBackgroundColor: isDarkMode ? ConstantColor.darkBg : Colors.white,
      canvasColor:
          isDarkMode ? ConstantColor.materialDarkBg : ConstantColor.materialBg,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: ConstantColor.primary.withAlpha(70),
        selectionHandleColor: ConstantColor.primary,
        cursorColor: ConstantColor.primary,
      ),
      textTheme: TextTheme(
        subtitle1: isDarkMode ? ConstantText.textDark : ConstantText.text,
        bodyText2: isDarkMode ? ConstantText.textDark : ConstantText.text,
        subtitle2: isDarkMode
            ? ConstantText.textDarkSecondary
            : ConstantText.textSecondary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            isDarkMode ? ConstantText.textHint14 : ConstantText.textDarkGrey14,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: isDarkMode ? ConstantColor.darkBg : ConstantColor.bg,
        systemOverlayStyle:
            isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      dividerTheme: DividerThemeData(
        color: isDarkMode ? ConstantColor.darkLine : ConstantColor.line,
        space: 0.6,
        thickness: 0.6,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      // pageTransitionsTheme: ,
      visualDensity: VisualDensity.standard,
    );
  }
}
