import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';

class LoginVM extends ChangeNotifier {
  final BuildContext context;

  LoginVM({required this.context});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  bool _obscureText = false;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isChecked => _isChecked;
  bool get obscureText => _obscureText;

  void onChanged(bool? value) {
    _isChecked = value!;
    _obscureText = value;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'required_field'.translate(context);
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'required_field'.translate(context);
    }
    return null;
  }

  onLogin() {
    
  }
}
