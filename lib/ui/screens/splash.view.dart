import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(child: Text('hello'.translate(context))),
      ),
    );
  }
}
