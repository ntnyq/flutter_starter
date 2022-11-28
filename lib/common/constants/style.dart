import 'package:flutter/material.dart';

class ConstantColor {
  static const Color bg = Color(0xFFF1F1F1);
  static const Color darkBg = Color(0xFF18191A);

  static const Color primary = Color(0xFF4688FA);
  static const Color darkPrimary = Color(0xFF3F7AE0);

  static const Color red = Color(0xFFFF4759);
  static const Color darkRed = Color(0xFFE03E4E);

  static const Color materialBg = Color(0xFFFFFFFF);
  static const Color materialDarkBg = Color(0xFF303233);

  static const Color line = Color(0xFFEEEEEE);
  static const Color darkLine = Color(0xFF3A3C3D);

  static const Color unselectedItemColor = Color(0xffbfbfbf);
  static const Color darkUnselectedItemColor = Color(0xFF4D4D4D);

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF999999);
  static const Color textThird = Color(0xFFCCCCCC);

  static const Color darkTextPrimary = Color(0xFFB8B8B8);
  static const Color darkTextSecondary = Color(0xFF666666);
  static const Color darkTextThird = Color(0xFFF2F2F2);
}

class ConstantText {
  static const TextStyle text = TextStyle(
    fontSize: 14,
    color: ConstantColor.textPrimary,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle textDark = TextStyle(
    fontSize: 14,
    color: ConstantColor.darkTextPrimary,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle textSecondary = TextStyle(
    fontSize: 12,
    color: ConstantColor.textSecondary,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle textDarkSecondary = TextStyle(
    fontSize: 12,
    color: ConstantColor.darkTextSecondary,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle textBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textHint14 = TextStyle(
    fontSize: 14,
    color: ConstantColor.darkBg,
  );

  static const TextStyle textDarkGrey14 = TextStyle(
    fontSize: 14,
    color: ConstantColor.textThird,
  );
}

class AppGap {
  static const Widget empty = SizedBox.shrink();
  static const Widget line = Divider();
  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget w4 = SizedBox(width: 4);
  static const Widget w5 = SizedBox(width: 5);
  static const Widget w8 = SizedBox(width: 8);
  static const Widget w10 = SizedBox(width: 10);
  static const Widget w16 = SizedBox(width: 16);

  static const Widget h4 = SizedBox(height: 4);
  static const Widget h5 = SizedBox(height: 5);
  static const Widget h8 = SizedBox(height: 8);
  static const Widget h10 = SizedBox(height: 10);
  static const Widget h16 = SizedBox(height: 16);
  static const Widget h24 = SizedBox(height: 24);
}
