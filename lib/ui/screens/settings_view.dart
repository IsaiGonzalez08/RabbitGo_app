import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/common/utils/utilities.dart';
import 'package:rabbit_go/viewmodels/settings_vm.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsVM>.reactive(
        viewModelBuilder: () => SettingsVM(),
        builder: (context, settingsVM, child) {
          return Scaffold(
            appBar: Utilities.titleAppBar(context, 'settings', false),
            body: _body(settingsVM),
          );
        });
  }

  Widget _body(SettingsVM settingsVM) {
    return Column(
      children: [
        _rowInfoProfile(),
        Expanded(child: _settingsButtton(settingsVM)),
        _closeSessionBtn()
      ],
    );
  }

  Widget _rowInfoProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: RabbitGoColors.secondaryColor),
              ),
              Text(
                'Prueba@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: RabbitGoColors.secondaryColor[400]),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                'free'.translate(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget _settingsButtton(SettingsVM settingsVM) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: settingsVM.buttonsCount,
        itemBuilder: (context, index) {
          final buttonData = settingsVM.textButtons[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, buttonData['route'] ?? '');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      buttonData['name'].translate(context),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: RabbitGoColors.secondaryColor),
                    ),
                    const Icon(LucideIcons.chevronRight,
                        size: 20, color: RabbitGoColors.secondaryColor)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _closeSessionBtn() {
    return InkWell(
      onTap: () {
        debugPrint('object');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'close_session'.translate(context),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: RabbitGoColors.redColor[50]),
              ),
              const Icon(LucideIcons.logOut,
                  size: 20, color: RabbitGoColors.secondaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
