import 'package:flutter/material.dart';
import 'package:flutter_starter/common/router/navigator.dart';
import 'package:flutter_starter/play/router.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';
import 'package:flutter_starter/widgets/my_button.dart';
import 'package:flutter_starter/common/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        ],
      ),
    );
  }
}
