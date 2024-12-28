import 'package:flutter/material.dart';

class WelcomeVM extends ChangeNotifier {
  final BuildContext context;
  final Function() navigateToLogin;

  WelcomeVM({required this.context ,required this.navigateToLogin});

  onNavigateLogin() {
    navigateToLogin();
  }
}