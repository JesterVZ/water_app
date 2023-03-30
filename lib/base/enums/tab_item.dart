import 'package:flutter/cupertino.dart';
import 'package:water_app/presentation/icons/water_app_icons.dart';

enum TabItem { main, downloads, logs, users }

const Map<TabItem, String> names = {
  TabItem.main: "Главная",
  TabItem.downloads: "Загрузки",
  TabItem.logs: "Журнал",
  TabItem.users: "Пользователи"
};

// ignore: constant_identifier_names
const Map<TabItem, IconData> TabIcons = {
  TabItem.main: WaterApp.home,
  TabItem.downloads: WaterApp.downloads,
  TabItem.logs: WaterApp.logs,
  TabItem.users: WaterApp.profile
};
