import 'package:flutter/material.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';

class RabbitgoTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? hintText;
  final bool? obscureText;
  final TextInputType keyboardType;
  const RabbitgoTextfield(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType,
      this.obscureText,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: RabbitGoColors.primaryColor),
      decoration: InputDecoration(
          filled: true,
          fillColor: RabbitGoColors.secondaryColor[200],
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: RabbitGoColors.secondaryColor[300])),
          
    );
  }
}
