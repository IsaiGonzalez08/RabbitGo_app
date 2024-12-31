import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';

class SignUpVM extends ChangeNotifier {
  final BuildContext context;

  SignUpVM({required this.context});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isChecked = false;
  bool _obscureText = false;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get lastnameController => _lastnameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
  bool get isChecked => _isChecked;
  bool get obscureText => _obscureText;

  void onChanged(bool? value) {
    _isChecked = value!;
    _obscureText = value;
    notifyListeners();
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'required_field'.translate(context);
    }
    return null;
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

  onSignUp() async {
  if (_formKey.currentState?.validate() ?? false) {
      await singUp();
    }
  }

  singUp() {

  }
}