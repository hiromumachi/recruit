import 'package:recruitfrontend/constant/route_name.dart';
import 'package:recruitfrontend/widget/page/main/view/main_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeEnum = _parseRouteEnum(settings.name);

    switch (routeEnum) {
      case RouteEnum.main:
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );

      default:
        throw Exception('Route not found');
    }
  }

  static RouteEnum _parseRouteEnum(String? route) {
    for (var entry in routeName.entries) {
      if (entry.value == route) {
        return entry.key;
      }
    }
    throw Exception('Unknown route');
  }
}
