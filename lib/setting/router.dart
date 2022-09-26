import 'package:fluro/fluro.dart';
import 'package:flutter_starter/common/router/interface.dart';
import 'package:flutter_starter/setting/pages/about_page.dart';
import 'package:flutter_starter/setting/pages/demo_page.dart';
import 'package:flutter_starter/setting/pages/locale_page.dart';
import 'package:flutter_starter/setting/pages/setting_page.dart';
import 'package:flutter_starter/setting/pages/theme_page.dart';

class SettingRouter implements IRouterProvider {
  static const String settingPage = '/setting';
  static const String demoPage = '/setting/demo';
  static const String aboutPage = '/setting/about';
  static const String themePage = '/setting/theme';
  static const String localePage = '/setting/locale';

  @override
  void initRouter(FluroRouter router) {
    router.define(
      settingPage,
      handler: Handler(handlerFunc: (_, __) => const SettingPage()),
    );
    router.define(
      demoPage,
      transitionType: TransitionType.inFromRight,
      handler: Handler(handlerFunc: (_, __) => const DemoPage()),
    );

    router.define(
      themePage,
      handler: Handler(handlerFunc: (_, __) => const ThemePage()),
    );

    router.define(
      localePage,
      handler: Handler(handlerFunc: (_, __) => const LocalePage()),
    );

    router.define(
      aboutPage,
      handler: Handler(handlerFunc: (_, __) => const AboutPage()),
    );
  }
}
