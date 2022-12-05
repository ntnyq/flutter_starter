import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';
import 'package:flutter_starter/widgets/my_button.dart';
import 'package:flutter_starter/common/constants/constants.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: '功能测试',
      ),
      body: Column(
        children: <Widget>[
          MyButton(
            minWidth: 80,
            text: '震动',
            onPressed: () async {
              if (await Vibration.hasVibrator() ?? false) {
                if (await Vibration.hasAmplitudeControl() ?? false) {
                  Vibration.vibrate(amplitude: 200);
                } else {
                  Vibration.vibrate();
                }
              }
            },
          ),
          AppGap.h16,
          MyButton(
            text: '微信分享',
            minWidth: 80,
            onPressed: () {
              EasyLoading.showError('暂未支持');
            },
          )
        ],
      ),
    );
  }
}
