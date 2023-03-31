import 'package:flutter/material.dart';
import 'package:water_app/base/enums/tab_item.dart';
import 'package:water_app/presentation/ui/app_colors.dart';

class BottomNavigation extends StatelessWidget {
  ///Кастомный BottomNavigationBar
  ///
  /// Принимает конкретный [TabItem] в качестве текущей стрвницы
  TabItem currentTab;
  Function(TabItem tabItem) onSelectTab;
  BottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _buildItem(TabItem.main, Icons.home),
        _buildItem(TabItem.downloads, Icons.download),
        _buildItem(TabItem.logs, Icons.list_alt_rounded),
        _buildItem(TabItem.users, Icons.supervised_user_circle_sharp)
      ],
      onTap: (index) {
        onSelectTab(TabItem.values[index]);
      },
      currentIndex: currentTab.index,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, IconData icon) {
    return BottomNavigationBarItem(
        backgroundColor: AppColors.appcolors,
        icon: Icon(icon, color: _colorMatching(tabItem)),
        label: names[tabItem]);
  }

  Color _colorMatching(TabItem item) {
    return AppColors.whiteColor;
  }
}
