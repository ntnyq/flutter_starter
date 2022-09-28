import 'package:fluro/fluro.dart';
import 'package:flutter_starter/common/router/interface.dart';
import 'package:flutter_starter/play/pages/amap_page.dart';
import 'package:flutter_starter/play/pages/azlist_page.dart';
import 'package:flutter_starter/play/pages/play_page.dart';
import 'package:flutter_starter/play/pages/silver_page.dart';

class PlayRouter implements IRouterProvider {
  static const String playPage = '/play';
  static const String azlistPage = '/play/azlist';
  static const String aMapPage = '/play/amap';
  static const String silverPage = '/play/silver';

  @override
  void initRouter(FluroRouter router) {
    router.define(
      playPage,
      handler: Handler(handlerFunc: (_, __) => const PlayPage()),
    );

    router.define(
      aMapPage,
      handler: Handler(handlerFunc: (_, __) => const AMapPage()),
    );

    router.define(
      azlistPage,
      handler: Handler(handlerFunc: (_, __) => const AzListPage()),
    );

    router.define(
      silverPage,
      handler: Handler(handlerFunc: (_, __) => const SilverPage()),
    );
  }
}
