/* import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers() {
  List<SingleChildWidget> providers = [
    Provider.value(
      value: const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true))
    ),
    ProxyProvider<FlutterSecureStorage, Session>(
      update: (context, flutterSecureStorage, previous) => Session.newInstance(flutterSecureStorage: flutterSecureStorage),
    ),
  ];

  return providers;
} */
