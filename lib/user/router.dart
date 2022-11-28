import 'package:fluro/fluro.dart';
import 'package:flutter_starter/common/router/interface.dart';
import 'package:flutter_starter/user/pages/user_page.dart';

class UserRouter implements IRouterProvider {
  static const String userPage = '/user';

  @override
  void initRouter(FluroRouter router) {
    router.define(
      userPage,
      handler: Handler(handlerFunc: (_, __) => const UserPage()),
    );
  }
}
