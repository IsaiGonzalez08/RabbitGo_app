import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/common/utils/utilities.dart';
import 'package:rabbit_go/routing/route_paths.dart';
import 'package:rabbit_go/ui/controls/rabbitgo_textfield.dart';
import 'package:rabbit_go/viewmodels/login_vm.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginVM>.reactive(
        viewModelBuilder: () => LoginVM(
            context: context,
            navigateToSignUp: _navigateToSignUp,
            navigateToHomeUser: _navigateToHomeUser),
        builder: (context, loginVM, child) {
          return Scaffold(
            appBar: Utilities.defaultAppBar(context),
            body: _body(loginVM),
          );
        });
  }

  Widget _body(LoginVM loginVM) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            _imgLogo(),
            _txtWelcome(),
            _txtSubtitle(),
            _form(loginVM),
            _btnCheckbox(loginVM),
            _btnStart(loginVM),
            _txtCreateAccount(loginVM)
          ],
        ),
      ),
    );
  }

  Widget _imgLogo() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.asset('assets/images/login_logo.png'),
    );
  }

  Widget _txtWelcome() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          'welcome_again'.translate(context),
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: RabbitGoColors.primaryColor),
        ),
      ),
    );
  }

  Widget _txtSubtitle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'enter_your_information'.translate(context),
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: RabbitGoColors.secondaryColor[400]),
        ),
      ),
    );
  }

  Widget _form(LoginVM loginVM) {
    return Form(
        key: loginVM.formKey,
        child: Column(
          children: [_txtEmail(loginVM), _txtPassword(loginVM)],
        ));
  }

  Widget _txtEmail(LoginVM loginVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: loginVM.emailController,
        validator: loginVM.validateEmail,
        hintText: 'email'.translate(context),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: loginVM.emailFocusNode,
        onFieldSubmitted: (_) =>
            FocusScope.of(context).requestFocus(loginVM.passwordFocusNode),
      ),
    );
  }

  Widget _txtPassword(LoginVM loginVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: loginVM.passwordController,
        validator: loginVM.validatePassword,
        hintText: 'password'.translate(context),
        obscureText: loginVM.obscureText,
        keyboardType: TextInputType.visiblePassword,
        enableSuggestions: false,
        textInputAction: TextInputAction.done,
        focusNode: loginVM.passwordFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).unfocus();
          loginVM.onLogin();
        },
      ),
    );
  }

  Widget _btnCheckbox(LoginVM loginVM) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.75,
          child: Checkbox(
              side: BorderSide(
                  color: RabbitGoColors.secondaryColor[200]!, width: 1),
              activeColor: RabbitGoColors.primaryColor,
              value: loginVM.isChecked,
              onChanged: loginVM.onChanged),
        ),
        Text(
          'hide_password'.translate(context),
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: RabbitGoColors.secondaryColor[400]),
        )
      ],
    );
  }

  Widget _btnStart(LoginVM loginVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => loginVM.onLogin(),
          child: Text(
            'start'.translate(context),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          )),
    );
  }

  Widget _txtCreateAccount(LoginVM loginVM) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'account'.translate(context),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: RabbitGoColors.secondaryColor),
          ),
          const SizedBox(
            width: 4,
          ),
          InkWell(
            onTap: () => loginVM.onNavigateToSignUp(),
            child: Text('create_account'.translate(context),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: RabbitGoColors.primaryColor)),
          )
        ],
      ),
    );
  }

  _navigateToSignUp() {
    Navigator.of(context).pushNamed(RoutePaths.signup);
  }

  _navigateToHomeUser() {
    Navigator.of(context).pushNamed(RoutePaths.homeUser);
  }
}
