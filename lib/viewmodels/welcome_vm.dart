import 'package:flutter/material.dart';

class WelcomeVM extends ChangeNotifier {
  final BuildContext context;
  final Function() navigateToLogin;
  final Function() navigateToSignUp;

  WelcomeVM(
      {required this.context,
      required this.navigateToLogin,
      required this.navigateToSignUp});

  onNavigateLogin() {
    navigateToLogin();
  }

  onNavigateSignUp() {
    navigateToSignUp();
  }
}
