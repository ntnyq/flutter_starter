import 'package:flutter/foundation.dart';

class ConstantEnv {
  /// [isProduction] Release 环境为 `true`
  static const bool isProduction = kReleaseMode;

  static const String appName = 'Flutter Starter';
}
