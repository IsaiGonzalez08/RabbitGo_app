import 'dart:async';

import 'package:flutter/material.dart';

class SplashVM extends ChangeNotifier {
  final Function() navigateToWelcome;

  SplashVM({required this.navigateToWelcome});

  init() {
    Timer(
      const Duration(seconds: 4), 
      () { 
        onNavigateToWelcome();
      }
    );
  }

  onNavigateToWelcome() {
    navigateToWelcome();
  }
}