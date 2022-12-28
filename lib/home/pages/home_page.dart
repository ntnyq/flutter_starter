import 'package:flutter/material.dart';
import 'package:flutter_starter/common/router/navigator.dart';
import 'package:flutter_starter/play/router.dart';
import 'package:flutter_starter/system/router.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';
import 'package:flutter_starter/widgets/my_button.dart';
import 'package:flutter_starter/common/constants/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  showActionSheet() {
    showCupertinoModalBottomSheet(
      context: context,
      builder: ((context) {
        return Container(
          height: 200,
          decoration: const BoxDecoration(
            color: ConstantColor.primary,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: ConstantEnv.appName,
        hasBack: false,
      ),
      body: Column(
        children: <Widget>[
          MyButton(
            text: '城市选择',
            onPressed: () {
              AppNavigator.push(context, PlayRouter.azlistPage);
            },
          ),
          AppGap.h16,
          MyButton(
            text: 'Silver示例',
            onPressed: () {
              AppNavigator.push(context, PlayRouter.silverPage);
            },
          ),
          AppGap.h16,
          MyButton(
            text: 'Webview示例',
            onPressed: () {
              AppNavigator.goWebviewPage(
                context,
                title: '稀土掘金',
                url: 'https://juejin.cn',
              );
            },
          ),
          AppGap.h16,
          MyButton(
            text: 'ActionSheet示例',
            onPressed: () {
              showActionSheet();
            },
          ),
          AppGap.h16,
          MyButton(
            text: '视频播放',
            onPressed: () {
              AppNavigator.push(context, SystemRouter.videoPage);
            },
          ),
        ],
      ),
    );
  }
}
