import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';
import 'package:flutter_starter/widgets/version_shower.dart';

class VersionPage extends StatefulWidget {
  const VersionPage({super.key});

  @override
  State<VersionPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '版本信息',
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: VersionShower(),
            )
          ],
        ),
      ),
    );
  }
}
