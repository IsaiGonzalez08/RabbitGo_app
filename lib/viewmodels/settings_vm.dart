import 'package:flutter/material.dart';

class SettingsVM extends ChangeNotifier {
  

  final List<String> _textButtons = [
    'Perfil',
    'Subscripción',
    'General'
  ];

  List<String> get textButtons => _textButtons;
  int get buttonsCount => _textButtons.length;
}