import 'package:fluro/fluro.dart';
import 'package:flutter_starter/common/router/interface.dart';
import 'package:flutter_starter/home/pages/home_page.dart';

class HomeRouter implements IRouterProvider {
  static const String homePage = '/home';

  @override
  void initRouter(FluroRouter router) {
    router.define(
      homePage,
      handler: Handler(handlerFunc: (_, __) => const HomePage()),
    );
  }
}
