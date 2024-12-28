import 'package:firebase_core/firebase_core.dart';
import 'package:rabbit_go/common/config.dart';
import 'package:rabbit_go/common/flavor.dart';
import 'package:rabbit_go/firebase_options_dev.dart' as dev;
import 'package:rabbit_go/firebase_options_staging.dart' as staging;
import 'package:rabbit_go/firebase_options_production.dart' as production;

Future<void> initializeFirebaseApp() async {
  
  final firebaseOptions = switch (Config.appFlavor) {
    Flavor.dev => dev.DefaultFirebaseOptions.currentPlatform,
    Flavor.staging => staging.DefaultFirebaseOptions.currentPlatform,
    Flavor.production => production.DefaultFirebaseOptions.currentPlatform
  };
  
  await Firebase.initializeApp(options: firebaseOptions);
}