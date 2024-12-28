import 'package:flutter/material.dart';

class Utilities {
  static AppBar defaultAppBar(BuildContext context) {
    return AppBar(
      leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              'assets/images/left_arrow.png',
              width: 30,
            ),
          )),
    );
  }
}
