import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionShower extends StatefulWidget {
  const VersionShower({super.key});

  @override
  State<VersionShower> createState() => _VersionShowerState();
}

class _VersionShowerState extends State<VersionShower> {
  String version = '1.0.0';

  @override
  void initState() {
    super.initState();
    _fetchVersion();
  }

  _fetchVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      if (mounted) {
        setState(() {
          version = packageInfo.version;
        });
      }
    } catch (e) {
      setState(() {
        version = '未知';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text('版本 $version');
  }
}
