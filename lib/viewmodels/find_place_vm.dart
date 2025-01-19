import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';

class FindPlaceVM extends ChangeNotifier {
  BuildContext context;

  FindPlaceVM({required this.context});

  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  TextEditingController get startController => _startController;
  TextEditingController get endController => _endController;

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'required_field'.translate(context);
    }
    return null;
  } 
}