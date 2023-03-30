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
          _buildItem(TabItem.main),
          _buildItem(TabItem.downloads),
          _buildItem(TabItem.logs),
          _buildItem(TabItem.users)
        ],
        onTap: (index) {
          onSelectTab(TabItem.values[index]);
        },
        currentIndex: currentTab.index,
        type: BottomNavigationBarType.fixed);
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
        icon: Icon(TabIcons[tabItem], color: _colorMatching(tabItem)),
        label: names[tabItem]);
  }

  Color _colorMatching(TabItem item) {
    return currentTab == item ? AppColors.appcolors : AppColors.whiteColor;
  }
}
