import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';

class LoginVM extends ChangeNotifier {
  final BuildContext context;
  final Function() navigateToSignUp;

  LoginVM({required this.context, required this.navigateToSignUp});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isChecked = false;
  bool _obscureText = false;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  bool get isChecked => _isChecked;
  bool get obscureText => _obscureText;

  buildConfig() {
    return KeyboardActionsConfig(
      defaultDoneWidget: Container(),
      actions: [
        KeyboardActionsItem(focusNode: _emailFocusNode),
        KeyboardActionsItem(focusNode: _passwordFocusNode),
      ],
    );
  }

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

  onLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      await login();
    }
  }

  login() {}

  onNavigateToSignUp() {
    navigateToSignUp();
  }
}
