import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';

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
        children: const <Widget>[
          Text('Hello world'),
          Text('Hello world'),
          Text('Hello world'),
          Text('Hello world'),
        ],
      ),
    );
  }
}
