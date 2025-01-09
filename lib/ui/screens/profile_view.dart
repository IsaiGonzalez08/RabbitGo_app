import 'package:flutter/material.dart';

class ConfigurationView extends StatefulWidget {
  const ConfigurationView({super.key});

  @override
  State<ConfigurationView> createState() => _ConfigurationViewState();
}

class _ConfigurationViewState extends State<ConfigurationView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('hola'),),
    );
  }
}