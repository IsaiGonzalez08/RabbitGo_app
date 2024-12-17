import 'dart:ui';
import 'package:fimber/fimber.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:rabbit_go/common/utils/app_localizations.dart';
import 'package:rabbit_go/common/utils/firebase.dart';
import 'package:rabbit_go/common/utils/rabbit_go_theme.dart';
import 'package:rabbit_go/routing/router.dart';
import 'package:rabbit_go/ui/screens/splash.view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> mainCommon() async {
  Fimber.plantTree(DebugTree());

  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      locale: const Locale('es'),
      child: MaterialApp(
        title: 'RabbitGO',
        theme: rabbitGoTheme,
        home: const SplashView(),
        locale: const Locale('es'),
        supportedLocales: const [Locale('es')],
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateMainRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
