import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/system/pages/navigation_page.dart';
import 'package:flutter_starter/system/router.dart';
import 'package:flutter_starter/user/router.dart';
import 'package:flutter_starter/home/router.dart';
import 'package:flutter_starter/play/router.dart';
import 'package:flutter_starter/setting/router.dart';
import 'package:flutter_starter/common/router/interface.dart';

class Routes {
  static String navigation = '/navigation';
  static String webviewPage = '/webview';

  static final FluroRouter router = FluroRouter();
  static final List<IRouterProvider> _listRouter = [];

  static void initRoutes() {
    router.notFoundHandler = Handler(handlerFunc: ((_, __) {
      return const Scaffold(
        body: Center(
          child: Text('404 Not Found'),
        ),
      );
    }));

    _listRouter.clear();

    router.define(
      navigation,
      handler: Handler(handlerFunc: (_, __) => const NavigationPage()),
    );

    // Add router module
    _listRouter.add(HomeRouter());
    _listRouter.add(PlayRouter());
    _listRouter.add(UserRouter());
    _listRouter.add(SystemRouter());
    _listRouter.add(SettingRouter());

    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
