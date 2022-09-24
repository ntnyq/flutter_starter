import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_starter/common/providers/providers.dart';
import 'package:flutter_starter/common/router/navigator.dart';
import 'package:flutter_starter/setting/router.dart';
import 'package:flutter_starter/widgets/clickable_item.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';
import 'package:flutter_starter/common/constants/constants.dart';
import 'package:flutter_starter/setting/widgets/exit_dialog.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  _getCurrentTheme() {
    final String? theme = SpUtil.getString(ConstantStorage.themeKey);
    String themeMode;
    switch (theme) {
      case 'Dark':
        themeMode = '开启';
        break;
      case 'Light':
        themeMode = '关闭';
        break;
      default:
        themeMode = '跟随系统';
        break;
    }
    return themeMode;
  }

  _getCurrentLocale() {
    final String? locale = SpUtil.getString(ConstantStorage.localeKey);
    String localeMode;
    switch (locale) {
      case 'zh':
        localeMode = '中文';
        break;
      case 'en':
        localeMode = 'English';
        break;
      default:
        localeMode = '跟随系统';
        break;
    }
    return localeMode;
  }

  _showExitDialog() {
    showDialog<void>(context: context, builder: (_) => const ExitDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '设置',
      ),
      body: Column(
        children: <Widget>[
          AppGap.h5,
          const ClickableItem(title: '账号管理'),
          Consumer<ThemeProvider>(
            builder: (_, provider, child) {
              return ClickableItem(
                title: '夜间模式',
                content: _getCurrentTheme(),
                onTap: () =>
                    AppNavigator.push(context, SettingRouter.themePage),
              );
            },
          ),
          Consumer<LocaleProvider>(
            builder: (_, provider, child) {
              return ClickableItem(
                title: '多语言',
                content: _getCurrentLocale(),
                onTap: () =>
                    AppNavigator.push(context, SettingRouter.localePage),
              );
            },
          ),
          const ClickableItem(title: '检查更新'),
          ClickableItem(
            title: '关于我们',
            onTap: () => AppNavigator.push(context, SettingRouter.aboutPage),
          ),
          ClickableItem(
            title: '退出登录',
            onTap: _showExitDialog,
          ),
        ],
      ),
    );
  }
}
