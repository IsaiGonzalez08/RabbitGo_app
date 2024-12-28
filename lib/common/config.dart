import 'package:rabbit_go/common/flavor.dart';

class Config {
  static Flavor appFlavor = Flavor.dev;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return "";
      case Flavor.staging:
        return "";
      case Flavor.dev:
        return "";
    }
  }

  static String get termsAndConditionsUrl {
    return "";
  }

  static String get privacyPolicyUrl {
    return "";
  }
  
}
