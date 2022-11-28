import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/common/router/routes.dart';
import 'package:flutter_starter/system/pages/splash_page.dart';
import 'package:flutter_starter/common/utils/utils.dart';
import 'package:flutter_starter/common/constants/constants.dart';
import 'package:flutter_starter/common/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  await SpUtil.getInstance();

  runApp(MyApp());

  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  //   overlays: [SystemUiOverlay.bottom],
  // );
}

class MyApp extends StatelessWidget {
  final Widget? home;
  final ThemeData? theme;

  MyApp({
    super.key,
    this.home,
    this.theme,
  }) {
    Routes.initRoutes();
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Widget _buildMaterialApp(
    ThemeProvider themeProvider,
    LocaleProvider localeProvider,
  ) {
    return MaterialApp(
      title: ConstantEnv.appName,
      debugShowCheckedModeBanner: false,
      theme: theme ?? themeProvider.getTheme(),
      darkTheme: themeProvider.getTheme(isDarkMode: true),
      themeMode: themeProvider.getThemeMode(),
      home: home ?? const SplashPage(),
      onGenerateRoute: Routes.router.generator,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
      locale: localeProvider.locale,
      navigatorKey: navigatorKey,
      builder: (BuildContext context, Widget? child) {
        EasyLoading.init();

        if (UtilDevice.isAndroid) {
          UtilTheme.setSystemNavigationBar(themeProvider.getThemeMode());
        }

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: ((
          _,
          ThemeProvider themeProvider,
          LocaleProvider localeProvider,
          __,
        ) {
          return _buildMaterialApp(themeProvider, localeProvider);
        }),
      ),
    );

    return app;
  }
}
