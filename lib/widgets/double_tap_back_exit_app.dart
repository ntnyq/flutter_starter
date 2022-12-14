import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DoubleTapBackExitApp extends StatefulWidget {
  final Widget child;

  /// 两次点击返回按钮的时间间隔
  final Duration duration;

  const DoubleTapBackExitApp({
    super.key,
    required this.child,
    this.duration = const Duration(microseconds: 2500),
  });

  @override
  State<DoubleTapBackExitApp> createState() => _DoubleTapBackExitAppState();
}

class _DoubleTapBackExitAppState extends State<DoubleTapBackExitApp> {
  DateTime? _lastTime;

  Future<bool> _isExit() async {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime!) > widget.duration) {
      _lastTime = DateTime.now();
      EasyLoading.showToast('再次点击退出应用');
      return Future.value(false);
    }

    /// 不推荐使用 `dart:io` 的 exit(0)
    await SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExit,
      child: widget.child,
    );
  }
}
