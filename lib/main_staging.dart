import 'package:rabbit_go/common/config.dart';
import 'package:rabbit_go/common/flavor.dart';
import 'package:rabbit_go/main.dart';

Future<void> main() async {
  Config.appFlavor = Flavor.staging;
  mainCommon();
}