import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/router/routes.dart';
import 'package:flutter_starter/system/router.dart';

class AppNavigator {
  static void unFocus() {
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    // FocusScope.of(context).unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void push(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    Object? arguments,
  }) {
    unFocus();
    Routes.router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: TransitionType.native,
      routeSettings: RouteSettings(arguments: arguments),
    );
  }

  static void goBack(BuildContext context) {
    unFocus();
    Navigator.pop(context);
  }

  static void goBackWithParams(BuildContext context, Object result) {
    unFocus();
    Navigator.pop<Object>(context, result);
  }

  static void goWebviewPage(
    BuildContext context, {
    required String title,
    required String url,
  }) {
    final String queryString =
        'title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}';
    push(context, '${SystemRouter.webviewPage}?$queryString');
  }
}
