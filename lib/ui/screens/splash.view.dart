import 'package:flutter/material.dart';
import 'package:rabbit_go/common/utils/rabbit_go_theme.dart';
import 'package:rabbit_go/routing/route_paths.dart';
import 'package:rabbit_go/viewmodels/splash_vm.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SplashVM(navigateToWelcome: _navigateToWelcome),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: RabbitGoColors.primaryColor,
            body: SizedBox(
              child: Center(
                  child: Image.asset(
                'assets/images/splash_logo.png',
                width: 80,
              )),
            ),
          );
        });
  }

  _navigateToWelcome() {
    Navigator.pushReplacementNamed(context, RoutePaths.welcome);
  }
}
