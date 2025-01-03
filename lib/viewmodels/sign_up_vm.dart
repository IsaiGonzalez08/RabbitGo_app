import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
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
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  bool _isChecked = false;
  bool _obscureText = false;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get lastnameController => _lastnameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
  FocusNode get nameFocusNode => _nameFocusNode;
  FocusNode get lastnameFocusNode => _lastnameFocusNode;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get confirmPasswordFocusNode => _confirmPasswordFocusNode;
  bool get isChecked => _isChecked;
  bool get obscureText => _obscureText;

  buildConfig() {
    return KeyboardActionsConfig(
      defaultDoneWidget: Container(),
      actions: [
        KeyboardActionsItem(focusNode: _nameFocusNode),
        KeyboardActionsItem(focusNode: _lastnameFocusNode),
        KeyboardActionsItem(focusNode: _emailFocusNode),
        KeyboardActionsItem(focusNode: _passwordFocusNode),
        KeyboardActionsItem(focusNode: _confirmPasswordFocusNode),
      ],
    );
  }

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

  onNavigateToHome() {

  }
}