import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/utils/rabbit_go_theme.dart';
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
        viewModelBuilder: () => LoginVM(context: context),
        builder: (context, loginVM, child) {
          return Scaffold(
            body: _body(loginVM),
          );
        });
  }

  Widget _body(LoginVM loginVM) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _imgLogo(),
          _txtWelcome(),
          _txtSubtitle(),
          _form(loginVM),
          _btnCheckbox(loginVM),
          _btnStart(loginVM),
          _txtCreateAccount()
        ],
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
              ?.copyWith(color: RabbitGoColors.secondaryColor[300]),
        ),
      ),
    );
  }

  Widget _form(LoginVM loginVM) {
    return Form(
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
      ),
    );
  }

  Widget _btnCheckbox(LoginVM loginVM) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            activeColor: RabbitGoColors.primaryColor,
            value: loginVM.isChecked,
            onChanged: loginVM.onChanged),
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

  Widget _txtCreateAccount() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
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
            onTap: () {},
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
}
