import 'package:flutter/material.dart';
import 'package:water_app/base/enums/tab_item.dart';
import 'package:water_app/presentation/pages/content/tabs/loads_tab.dart';
import 'package:water_app/presentation/pages/content/tabs/log_tab.dart';
import 'package:water_app/presentation/pages/content/tabs/main_tab.dart';
import 'package:water_app/presentation/pages/content/tabs/users_tab.dart';
import 'package:water_app/presentation/widgets/navigation/bottom_navigation.dart';
import 'package:water_app/presentation/widgets/navigation/tab_navigator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  var _currentTab = TabItem.main;

  final dropdownList = ['Выход'];

  ///ключи для навигаторов
  final _navKeys = {
    TabItem.main: GlobalKey<NavigatorState>(),
    TabItem.downloads: GlobalKey<NavigatorState>(),
    TabItem.logs: GlobalKey<NavigatorState>(),
    TabItem.users: GlobalKey<NavigatorState>()
  };
  List<Widget> navigatorList = [];

  @override
  void initState() {
    navigatorList.add(TabNavigator(
        navigatorKey: _navKeys[TabItem.main], rootPage: const MainTab()));
    navigatorList.add(TabNavigator(
        navigatorKey: _navKeys[TabItem.downloads], rootPage: const LoadsTab()));
    navigatorList.add(TabNavigator(
        navigatorKey: _navKeys[TabItem.logs], rootPage: const LogTab()));
    navigatorList.add(TabNavigator(
        navigatorKey: _navKeys[TabItem.users], rootPage: const UsersTab()));
    super.initState();
  }

  void _onSelectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('-=MSD1=-'),
          actions: _buildActions(),
        ),
        body: IndexedStack(
          index: _currentTab.index,
          children: [
            _buildNavigator(TabItem.main, navigatorList[0]),
            _buildNavigator(TabItem.downloads, navigatorList[1]),
            _buildNavigator(TabItem.logs, navigatorList[2]),
            _buildNavigator(TabItem.users, navigatorList[3])
          ],
        ),
        bottomNavigationBar: BottomNavigation(
            currentTab: _currentTab, onSelectTab: _onSelectTab),
      );

  Widget _buildNavigator(TabItem tabItem, Widget navigator) => Offstage(
        offstage: _currentTab != tabItem,
        child: navigator,
      );

  List<Widget> _buildActions() => [
        DropdownButton(
            hint: const Text('Админ Юзерович'),
            icon: const Icon(Icons.arrow_drop_down),
            underline: null,
            items: dropdownList
                .map((x) => DropdownMenuItem(child: Text(x)))
                .toList(),
            onChanged: (value) {})
      ];
}
