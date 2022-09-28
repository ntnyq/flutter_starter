import 'package:flutter/material.dart';
import 'package:flutter_2d_amap/flutter_2d_amap.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';

class AMapPage extends StatefulWidget {
  const AMapPage({super.key});

  @override
  State<AMapPage> createState() => _AMapPageState();
}

class _AMapPageState extends State<AMapPage> {
  @override
  void initState() {
    super.initState();
    Flutter2dAMap.updatePrivacy(true);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: '高德地图',
      ),
      body: AMap2DView(),
    );
  }
}
