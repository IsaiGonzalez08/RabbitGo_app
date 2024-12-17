import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rabbit_go/common/utils/app_localizations.dart';

extension StringExtension on String? {
  String get capitalize {
    return "${this![0].toUpperCase()}${this?.substring(1)}";
  }

  Map<String, dynamic> get toJson {
    return json.decode(this!);
  }

  String translate(BuildContext context) {
    return AppLocalization.of(context)?.translate(this!) ?? "";
  }

  String translateCapitalized(BuildContext context) {
    return translate(context).capitalize;
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}