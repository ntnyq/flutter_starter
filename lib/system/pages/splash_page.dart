import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_starter/common/router/routes.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_starter/common/router/navigator.dart';
import 'package:flutter_starter/common/constants/constants.dart';
import 'package:flutter_starter/widgets/fractionally_aligned_sized_box.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final List<String> _imageList = [
    'assets/images/splash/xt.jpg',
    'assets/images/splash/xt.jpg',
    'assets/images/splash/xt.jpg',
  ];
  StreamSubscription<dynamic>? _subscription;
  int _status = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initSplash();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initGuide() {
    setState(() {
      _status = 1;
    });
  }

  void _initSplash() {
    _subscription =
        Stream.value(1).delay(const Duration(milliseconds: 1500)).listen((_) {
      if (SpUtil.getBool(ConstantStorage.guideKey, defValue: true)!) {
        SpUtil.putBool(ConstantStorage.guideKey, false);
        _initGuide();
      } else {
        _goToNavigation();
        AppNavigator.push(context, Routes.navigation, clearStack: true);
      }
    });
  }

  void _goToNavigation() {
    AppNavigator.push(context, Routes.navigation, clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: context.backgroundColor,
      child: _status == 0
          ? FractionallyAlignedSizedBox(
              heightFactor: 0.3,
              widthFactor: 0.33,
              leftFactor: 0.33,
              bottomFactor: 0,
              child: Image.asset('assets/images/logo.png'),
            )
          : Swiper(
              key: const Key('swiper'),
              itemCount: _imageList.length,
              loop: false,
              itemBuilder: ((_, index) {
                return Image.asset(
                  _imageList[index],
                  key: Key(_imageList[index]),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              }),
              onTap: (index) {
                if (index == _imageList.length - 1) {
                  _goToNavigation();
                }
              },
            ),
    );
  }
}
