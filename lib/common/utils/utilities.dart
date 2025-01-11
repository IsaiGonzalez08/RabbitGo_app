import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';

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

  static AppBar titleAppBar(BuildContext context, String title, bool setLeading) {
    return AppBar(
      automaticallyImplyLeading: setLeading,
      centerTitle: true,
      title: Text(
        title.translate(context),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: RabbitGoColors.secondaryColor),
      ),
    );
  }
}

showErrorToast(BuildContext context, String message, {Duration? duration}) {
  showToastWidget(
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2,
              color: RabbitGoColors.blueColor[75] ?? Colors.transparent),
          color: RabbitGoColors.blueColor[50]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              LucideIcons.circleAlert,
              color: RabbitGoColors.blueColor[300],
              size: 20,
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                message.translate(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: RabbitGoColors.blueColor[500]),
              ),
            )),
            SizedBox(
              width: 20,
              height: 20,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => ToastManager().dismissAll(showAnim: true),
                  icon: const Icon(
                    LucideIcons.x,
                    size: 14,
                    color: Color(0xFF656785),
                  )),
            )
          ],
        ),
      ),
    ),
    context: context,
    duration: duration,
    isIgnoring: false,
    dismissOtherToast: true,
    position: StyledToastPosition(
        align: Alignment.topCenter, offset: MediaQuery.of(context).padding.top),
  );
}

showModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/bg_welcome.png',
                ))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/images/noti_alert.png',
                  width: 200,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'active_location'.translate(context),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: RabbitGoColors.primaryColor),
                ),
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 250),
                child: Text(
                  'set_permissions'.translate(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: RabbitGoColors.secondaryColor[400]),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35, bottom: 5),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => AppSettings.openAppSettings(
                        type: AppSettingsType.location),
                    child: Text(
                      'active'.translate(context),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'deny_access'.translate(context),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: RabbitGoColors.primaryColor),
                    )),
              )
            ],
          ),
        ),
      );
    },
  );
}
