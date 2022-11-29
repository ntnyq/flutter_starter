import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/common/constants/style.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';
import 'package:flutter_starter/widgets/my_button.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '我的',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MyButton(
            onPressed: () async {
              if (await FlutterAppBadger.isAppBadgeSupported()) {
                await FlutterAppBadger.updateBadgeCount(5);
                EasyLoading.showSuccess('新增成功');
              }
            },
            text: '增加桌面提示',
          ),
          AppGap.h16,
          MyButton(
            onPressed: () async {
              if (await FlutterAppBadger.isAppBadgeSupported()) {
                await FlutterAppBadger.removeBadge();
                EasyLoading.showSuccess('移除成功');
              }
            },
            text: '移除桌面提示',
          ),
        ],
      ),
    );
  }
}
