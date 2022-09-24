import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/setting/router.dart';
import 'package:flutter_starter/common/router/interface.dart';

class Routes {
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
    // Add router module
    _listRouter.add(SettingRouter());

    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
