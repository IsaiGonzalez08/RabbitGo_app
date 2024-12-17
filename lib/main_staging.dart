import 'package:rabbit_go/common/utils/config.dart';
import 'package:rabbit_go/common/utils/flavor.dart';
import 'package:rabbit_go/main.dart';

Future<void> main() async {
  Config.appFlavor = Flavor.staging;
  mainCommon();
}