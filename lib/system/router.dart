import 'package:fluro/fluro.dart';
import 'package:flutter_starter/common/router/interface.dart';
import 'package:flutter_starter/system/pages/webview_page.dart';

class SystemRouter implements IRouterProvider {
  static const String webviewPage = '/webview';

  @override
  void initRouter(FluroRouter router) {
    router.define(
      webviewPage,
      handler: Handler(handlerFunc: (_, params) {
        final String title = params['title']?.first ?? '';
        final String url = params['url']?.first ?? '';
        return WebviewPage(title: title, url: url);
      }),
    );
  }
}
