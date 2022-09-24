import 'package:flutter/material.dart';
import 'package:flutter_starter/common/utils/utils.dart';
import 'package:flutter_starter/common/constants/constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;

  const MyButton({
    super.key,
    this.text = '',
    this.fontSize = 18,
    this.textColor,
    this.disabledTextColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 48.0,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.radius = 2.0,
    this.side = BorderSide.none,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            // if (states.contains(MaterialState.disabled)) {
            //   return disabledTextColor ?? (isDark ? Colours.dark_text_disabled : Colours.text_disabled);
            // }
            return textColor ??
                (isDark ? ConstantColor.darkTextThird : Colors.white);
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          // if (states.contains(MaterialState.disabled)) {
          //   return disabledBackgroundColor ?? (isDark ? Colours.dark_button_disabled : Colours.button_disabled);
          // }
          return backgroundColor ??
              (isDark ? ConstantColor.darkPrimary : ConstantColor.primary);
        }),
        minimumSize: (minWidth == null || minHeight == null)
            ? null
            : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        side: MaterialStateProperty.all<BorderSide>(side),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
