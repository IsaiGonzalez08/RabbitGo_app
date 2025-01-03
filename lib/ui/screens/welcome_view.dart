import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/routing/route_paths.dart';
import 'package:rabbit_go/viewmodels/welcome_vm.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<StatefulWidget> createState() => _StateWelcomeView();
}

class _StateWelcomeView extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeVM>.reactive(
        viewModelBuilder: () => WelcomeVM(
              context: context,
              navigateToLogin: _navigateToLogin,
              navigateToSignUp: _navigateToSignUp,
            ),
        builder: (context, welcomeVM, child) {
          return Scaffold(
              backgroundColor: Colors.white, body: _body(welcomeVM));
        });
  }

  Widget _body(WelcomeVM welcomeVM) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/bg_welcome.png",
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: MediaQuery.of(context).size.height * 0.5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _txtTitle(),
                _txtSubtitle(),
                _btnHaveAccount(welcomeVM),
                _txtOr(),
                _btnLoginWithGoogle(),
                _txtCreateAccount(welcomeVM)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _txtTitle() {
    return Text(
      'welcome'.translate(context),
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: RabbitGoColors.primaryColor),
    );
  }

  Widget _txtSubtitle() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(
        textAlign: TextAlign.center,
        'subtitle'.translate(context),
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: RabbitGoColors.secondaryColor),
      ),
    );
  }

  Widget _btnHaveAccount(WelcomeVM welcomeVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => welcomeVM.onNavigateLogin(),
          child: Text(
            'have_account'.translate(context),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          )),
    );
  }

  Widget _txtOr() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
          child: Text(
        'or'.translate(context),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: RabbitGoColors.secondaryColor[500]),
      )),
    );
  }

  Widget _btnLoginWithGoogle() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: RabbitGoColors.secondaryColor[50]!,
            width: 1,
          )),
      width: double.infinity,
      height: 40,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/icon_google.png',
                width: 20,
              ),
              Text(
                'login_google'.translate(context),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: RabbitGoColors.secondaryColor[500]),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _txtCreateAccount(WelcomeVM welcomeVM) {
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
            onTap: () => welcomeVM.onNavigateSignUp(),
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

  _navigateToLogin() {
    Navigator.of(context).pushNamed(RoutePaths.login);
  }

  _navigateToSignUp() {
    Navigator.of(context).pushNamed(RoutePaths.signup);
  }
}
