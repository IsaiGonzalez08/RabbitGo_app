import 'package:flutter/material.dart';
import 'package:rabbit_go/routing/route_paths.dart';
import 'package:rabbit_go/ui/screens/welcome_view.dart';

Route<dynamic> generateMainRoute(RouteSettings settings) {
  String? routeName = settings.name;

  switch (routeName) {
    case RoutePaths.welcome:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const WelcomeView(),
      );
    default:
      return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (_) => const Center());
  }
}
