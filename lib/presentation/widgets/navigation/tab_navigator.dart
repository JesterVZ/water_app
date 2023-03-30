import 'package:flutter/material.dart';
import 'package:water_app/presentation/pages/content/tabs/loads_tab.dart';
import 'package:water_app/presentation/pages/content/tabs/log_tab.dart';
import 'package:water_app/presentation/pages/content/tabs/users_tab.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String downloads = '/downloads';
  static const String logs = '/logs';
  static const String users = '/users';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.rootPage});
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget rootPage;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => rootPage,
      TabNavigatorRoutes.downloads: (context) => const LoadsTab(),
      TabNavigatorRoutes.logs: (context) => const LogTab(),
      TabNavigatorRoutes.users: (context) => const UsersTab()
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context));
      },
    );
  }
}
