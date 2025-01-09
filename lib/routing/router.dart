import 'package:flutter/material.dart';
import 'package:rabbit_go/routing/route_paths.dart';
import 'package:rabbit_go/ui/screens/home_tab_bar_user.dart';
import 'package:rabbit_go/ui/screens/login_view.dart';
import 'package:rabbit_go/ui/screens/sign_up_view.dart';
import 'package:rabbit_go/ui/screens/welcome_view.dart';

Route<dynamic> generateMainRoute(RouteSettings settings) {
  String? routeName = settings.name;

  switch (routeName) {
    case RoutePaths.welcome:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const WelcomeView(),
      );
    case RoutePaths.login:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LoginView(),
      );
    case RoutePaths.signup:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SignUpView(),
      );
    case RoutePaths.homeUser:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomeTabBarUser(),
      );
    default:
      return MaterialPageRoute(
          settings: RouteSettings(name: routeName),
          builder: (_) => const Center());
  }
}
