import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/common/utils/utilities.dart';
import 'package:rabbit_go/ui/controls/rabbitgo_textfield.dart';
import 'package:rabbit_go/viewmodels/sign_up_vm.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignUpVM(context: context),
        builder: (context, signUpVM, child) {
          return Scaffold(
            appBar: Utilities.defaultAppBar(context),
            body: _body(signUpVM),
          );
        });
  }

  Widget _body(SignUpVM signUpVM) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            _txtTitle(),
            _txtSubtitle(),
            _form(signUpVM),
            _btnCheckbox(signUpVM),
            _txtTermsAndConditions(),
            _btnStart(signUpVM),
          ],
        ),
      ),
    );
  }

  Widget _txtTitle() {
    return Text(
      'enter_information'.translate(context),
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: RabbitGoColors.primaryColor),
    );
  }

  Widget _txtSubtitle() {
    return Text(
      'remember'.translate(context),
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: RabbitGoColors.secondaryColor[500]),
    );
  }

  Widget _form(SignUpVM signUpVM) {
    return Form(
        key: signUpVM.formKey,
        child: Column(
          children: [
            _txtRow(signUpVM),
            _txtEmail(signUpVM),
            _txtPassword(signUpVM),
            _txtConfirmPassword(signUpVM)
          ],
        ));
  }

  Widget _txtRow(SignUpVM signUpVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          _txtName(signUpVM),
          const SizedBox(
            width: 10,
          ),
          _txtLastname(signUpVM)
        ],
      ),
    );
  }

  Widget _txtName(SignUpVM signUpVM) {
    return Expanded(
      child: RabbitgoTextfield(
        controller: signUpVM.nameController,
        validator: signUpVM.validateField,
        hintText: 'name'.translate(context),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget _txtLastname(SignUpVM signUpVM) {
    return Expanded(
      child: RabbitgoTextfield(
        controller: signUpVM.nameController,
        validator: signUpVM.validateField,
        hintText: 'lastname'.translate(context),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget _txtEmail(SignUpVM signUpVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: signUpVM.emailController,
        validator: signUpVM.validateEmail,
        hintText: 'email'.translate(context),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _txtPassword(SignUpVM signUpVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: signUpVM.passwordController,
        validator: signUpVM.validatePassword,
        hintText: 'password'.translate(context),
        obscureText: signUpVM.obscureText,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget _txtConfirmPassword(SignUpVM signUpVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: signUpVM.confirmPasswordController,
        validator: signUpVM.validatePassword,
        hintText: 'confirm_password'.translate(context),
        obscureText: signUpVM.obscureText,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget _btnCheckbox(SignUpVM signUpVM) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.75,
          child: Checkbox(
              side: BorderSide(
                  color: RabbitGoColors.secondaryColor[200]!, width: 1),
              activeColor: RabbitGoColors.primaryColor,
              value: signUpVM.isChecked,
              onChanged: signUpVM.onChanged),
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

  Widget _txtTermsAndConditions() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/check_yes.png',
            width: 15,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              'terms_conditions'.translate(context),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: RabbitGoColors.secondaryColor[200]),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnStart(SignUpVM signUpVM) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => signUpVM.onSignUp(),
          child: Text(
            'start'.translate(context),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          )),
    );
  }
}
