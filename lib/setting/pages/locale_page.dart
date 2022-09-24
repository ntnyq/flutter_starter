import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_starter/widgets/my_app_bar.dart';
import 'package:flutter_starter/common/constants/constants.dart';
import 'package:flutter_starter/common/providers/providers.dart';

class LocalePage extends StatefulWidget {
  const LocalePage({super.key});

  @override
  State<LocalePage> createState() => _LocalePageState();
}

class _LocalePageState extends State<LocalePage> {
  final List<String> _list = <String>['跟随系统', '中文', 'English'];

  @override
  Widget build(BuildContext context) {
    final String? theme = SpUtil.getString(ConstantStorage.localeKey);
    String localeMode;
    switch (theme) {
      case 'zh':
        localeMode = _list[1];
        break;
      case 'en':
        localeMode = _list[2];
        break;
      default:
        localeMode = _list[0];
        break;
    }

    return Scaffold(
      appBar: const MyAppBar(
        title: '多语言',
      ),
      body: ListView.separated(
        itemCount: _list.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () {
              final String locale =
                  index == 0 ? '' : (index == 1 ? 'zh' : 'en');
              context.read<LocaleProvider>().setLocale(locale);
              setState(() {});
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(child: Text(_list[index])),
                  Opacity(
                    opacity: localeMode == _list[index] ? 1 : 0,
                    child: Icon(
                      Icons.done,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
