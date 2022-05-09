import 'package:flutter/material.dart';
import 'package:geniopay/core/navigators/routes.dart';
import 'package:geniopay/features/presentation/pages/activity_page.dart';
import 'package:geniopay/features/presentation/pages/home_container.dart';
import 'package:geniopay/features/presentation/pages/homepage.dart';

/// Generate routes for navigation
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomePage(),
      );
    case Routes.activityScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ActivityPage(),
      );
    case Routes.dashboardScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeContainer(
          params: settings.arguments as HomeContainerParams?,
        ),
      );
    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute<dynamic>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
