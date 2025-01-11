import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/common/utils/utilities.dart';
import 'package:rabbit_go/ui/controls/rabbitgo_textfield.dart';
import 'package:rabbit_go/viewmodels/profile_vm.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileVM>.reactive(
        viewModelBuilder: () => ProfileVM(context: context),
        builder: (context, profileVM, child) {
          return Scaffold(
            appBar: Utilities.titleAppBar(context, 'profile', true),
            body: _body(profileVM),
          );
        });
  }

  Widget _body(ProfileVM profileVM) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _profileImg(),
            _form(profileVM),
            _btnCheckbox(profileVM),
            _btnUpdate()
          ],
        ),
      ),
    );
  }

  Widget _profileImg() {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
            color: RabbitGoColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: const Center(child: Text('hola')),
      ),
    );
  }

  Widget _form(ProfileVM profileVM) {
    return Form(
      key: profileVM.formKey,
      child: Column(
        children: [
          _txtRow(profileVM),
          _txtEmail(profileVM),
          _txtPassword(profileVM),
          _txtConfirmPassword(profileVM),
        ],
      ),
    );
  }

  Widget _txtRow(ProfileVM profileVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          _txtName(profileVM),
          const SizedBox(
            width: 10,
          ),
          _txtLastname(profileVM)
        ],
      ),
    );
  }

  Widget _txtName(ProfileVM profileVM) {
    return Expanded(
      child: RabbitgoTextfield(
          controller: profileVM.nameController,
          validator: profileVM.validateField,
          hintText: 'name'.translate(context),
          keyboardType: TextInputType.name,
          withLabel: true,
          label: 'name'.translate(context),
          textInputAction: TextInputAction.next,
          focusNode: profileVM.nameFocusNode,
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(profileVM.lastnameFocusNode),
        ),
    );
  }

  Widget _txtLastname(ProfileVM profileVM) {
    return Expanded(
      child: RabbitgoTextfield(
        controller: profileVM.lastnameController,
        validator: profileVM.validateField,
        hintText: 'lastname'.translate(context),
        keyboardType: TextInputType.name,
        withLabel: true,
        label: 'lastname'.translate(context),
        textInputAction: TextInputAction.next,
        focusNode: profileVM.lastnameFocusNode,
        onFieldSubmitted: (_) =>
            FocusScope.of(context).requestFocus(profileVM.emailFocusNode),
      ),
    );
  }

  Widget _txtEmail(ProfileVM profileVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: profileVM.emailController,
        validator: profileVM.validateField,
        hintText: 'email'.translate(context),
        keyboardType: TextInputType.name,
        withLabel: true,
        label: 'email'.translate(context),
        textInputAction: TextInputAction.next,
        focusNode: profileVM.emailFocusNode,
        onFieldSubmitted: (_) =>
            FocusScope.of(context).requestFocus(profileVM.passwordFocusNode),
      ),
    );
  }

  Widget _txtPassword(ProfileVM profileVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: profileVM.passwordController,
        validator: profileVM.validateField,
        hintText: 'password'.translate(context),
        keyboardType: TextInputType.name,
        withLabel: true,
        label: 'password'.translate(context),
        textInputAction: TextInputAction.next,
        focusNode: profileVM.passwordFocusNode,
        onFieldSubmitted: (_) => FocusScope.of(context)
            .requestFocus(profileVM.confirmPasswordFocusNode),
      ),
    );
  }

  Widget _txtConfirmPassword(ProfileVM profileVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RabbitgoTextfield(
        controller: profileVM.confirmPasswordController,
        validator: profileVM.validateField,
        hintText: 'confirm_password'.translate(context),
        keyboardType: TextInputType.visiblePassword,
        withLabel: true,
        label: 'confirm_password'.translate(context),
        obscureText: profileVM.obscureText,
        enableSuggestions: false,
        textInputAction: TextInputAction.done,
        focusNode: profileVM.confirmPasswordFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).unfocus();
          profileVM.onUpdate();
        },
      ),
    );
  }

  Widget _btnCheckbox(ProfileVM profileVM) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.75,
          child: Checkbox(
              side: BorderSide(
                  color: RabbitGoColors.secondaryColor[200]!, width: 1),
              activeColor: RabbitGoColors.primaryColor,
              value: profileVM.isChecked,
              onChanged: profileVM.onChanged),
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

  Widget _btnUpdate() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'update'.translate(context),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          )),
    );
  }
}
