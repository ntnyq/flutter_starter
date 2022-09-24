import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/common/utils/utils.dart';
import 'package:flutter_starter/common/constants/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String centerTitle;
  final String actionName;
  final bool hasBack;
  final String backImg;
  final Color? backImgColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const MyAppBar({
    super.key,
    this.title = '',
    this.centerTitle = '',
    this.actionName = '',
    this.backImgColor,
    this.backgroundColor,
    this.backImg = 'assets/images/icon/back.png',
    this.hasBack = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? context.backgroundColor;
    final SystemUiOverlayStyle overlayStyle =
        ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;
    final Widget action = actionName.isNotEmpty
        ? Positioned(
            right: 0,
            child: Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: const ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  minWidth: 60,
                ),
              ),
              child: const Text('hello world'),
            ),
          )
        : AppGap.empty;
    final Widget back = hasBack
        ? IconButton(
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              final canGoBack = await Navigator.maybePop(context);
              if (!canGoBack) {
                await SystemNavigator.pop();
              }
            },
            tooltip: 'Back',
            padding: const EdgeInsets.all(12),
            icon: Image.asset(
              backImg,
              color: backImgColor ?? UtilTheme.getIconColor(context),
            ),
          )
        : AppGap.empty;

    final Widget titleWidget = Semantics(
      namesRoute: true,
      header: true,
      child: Container(
        alignment:
            centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 48),
        child: Text(
          title.isEmpty ? centerTitle : title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Material(
        color: bgColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              titleWidget,
              back,
              action,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
