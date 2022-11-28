import 'package:flutter/material.dart';
import 'package:flutter_starter/home/pages/home_page.dart';
import 'package:flutter_starter/play/pages/silver_page.dart';
import 'package:flutter_starter/setting/pages/setting_page.dart';
import 'package:flutter_starter/user/pages/user_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_starter/common/constants/constants.dart';
import 'package:flutter_starter/common/utils/utils.dart';
import 'package:flutter_starter/system/providers/navigation_provider.dart';
import 'package:flutter_starter/widgets/double_tap_back_exit_app.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with RestorationMixin {
  // static const double _imageSize = 25.0;
  late List<Widget> _pageList;
  final List<String> _appBarTitles = ['首页', '服务', '公示', '我的'];
  final PageController _pageController = PageController();

  NavigationProvider provider = NavigationProvider();
  List<BottomNavigationBarItem>? _list;
  // List<BottomNavigationBarItem>? _listDark;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initData() {
    _pageList = [
      const HomePage(),
      const SilverPage(),
      const UserPage(),
      const SettingPage(),
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const tabImages = [
        Icon(Icons.home),
        Icon(Icons.lock),
        Icon(Icons.email),
        Icon(Icons.headphones),
      ];
      _list = List.generate(tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: tabImages[i],
          // activeIcon: tabImages[i][1],
          label: _appBarTitles[i],
        );
      });
    }
    return _list!;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;
    return ChangeNotifierProvider(
      create: (_) => provider,
      child: DoubleTapBackExitApp(
        child: Scaffold(
          bottomNavigationBar: Consumer<NavigationProvider>(
            builder: (_, provider, __) {
              return BottomNavigationBar(
                backgroundColor: context.backgroundColor,
                items: _buildBottomNavigationBarItem(),
                currentIndex: provider.value,
                type: BottomNavigationBarType.fixed,
                elevation: 5,
                iconSize: 21,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: isDark
                    ? ConstantColor.darkUnselectedItemColor
                    : ConstantColor.unselectedItemColor,
                onTap: (int index) {
                  _pageController.jumpToPage(index);
                },
              );
            },
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int index) {
              provider.value = index;
            },
            children: _pageList,
          ),
        ),
      ),
    );
  }

  @override
  String? get restorationId => 'home';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, 'BottomNavigationBarCurrentIndex');
  }
}
