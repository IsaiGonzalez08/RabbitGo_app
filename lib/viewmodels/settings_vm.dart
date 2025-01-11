import 'package:flutter/material.dart';

class SettingsVM extends ChangeNotifier {
  final List<Map<String, String>> _textButtons = [
    {'name': 'profile', 'route': "/profile"},
    {'name': 'subscription', 'route': "/subscription"},
    {'name': 'general', 'route': "/general"}
  ];

  List<Map<String, String>> get textButtons => _textButtons;
  int get buttonsCount => _textButtons.length;
}
