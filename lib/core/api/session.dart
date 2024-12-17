/* import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Session {
  final FlutterSecureStorage _flutterSecureStorage;
  final String _sessionKey = "session";
  static Session? _instance;

  String? _token;
  SignInResponse? _userSession;

  static Session newInstance(
      {required FlutterSecureStorage flutterSecureStorage}) {
    if (_instance == null) {
      _instance = Session._(flutterSecureStorage: flutterSecureStorage);
      _instance?.init();
    }

    return _instance!;
  }

  Session._({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _flutterSecureStorage = flutterSecureStorage;

  init() async {
    try {
      _userSession = SignInResponse.fromJson((await _flutterSecureStorage.read(
                  key: _sessionKey, aOptions: _getAndroidOptions()))
              ?.toJson ??
          {});
      _token = _userSession?.token;
    } catch (ex) {
      _userSession = null;
      _token = null;
    }
  }

  logout() async {
    _token = null;
    _userSession = null;
    // ApiClient.removeErrorInterceptor();
    await _flutterSecureStorage.deleteAll(aOptions: _getAndroidOptions());
  }

  saveToken(SignInResponse signInResponse) async {
    await _flutterSecureStorage.write(
        key: _sessionKey,
        aOptions: _getAndroidOptions(),
        value: jsonEncode(signInResponse.toJson()));
    _userSession = signInResponse;
    _token = signInResponse.token;
  }

  Future<bool> get isLoggedIn async {
    await init();
    return _token != null;
  }

  Future<UserType?> get userType async {
    if(_userSession == null) {
      await init();
    }
    return _userSession?.userType;
  }

  String? get token {
    return _token;
  }

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
}
 */