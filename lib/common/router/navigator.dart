import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/router/routes.dart';

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
}
