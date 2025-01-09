import 'dart:async';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider {
  final Location _location = Location();
  StreamSubscription<LocationData>? _streamSubscription;

  Future<bool> askLocationPermission() async {
    PermissionStatus status = await _location.hasPermission();
    if (status == PermissionStatus.denied) {
      bool status = await _statusGPSPermission();
      if (!status) {
        _saveStatusGPSPermission(true);
        PermissionStatus permission = await _location.requestPermission();
        return permission == PermissionStatus.granted ||
            permission == PermissionStatus.grantedLimited;
      }
      return false;
    } else if (status == PermissionStatus.granted ||
        status == PermissionStatus.grantedLimited) {
      return true;
    }

    return false;
  }

  Future<LocationData?> getLocation() async {
    try {
      LocationData locationData = await _location.getLocation();
      return locationData;
    } catch (e) {
      return null;
    }
  }

  startUpdatingLocation(Function(LocationData) callback) async {
    if (_streamSubscription != null) {
      _streamSubscription?.resume();
    } else {
      _streamSubscription = _location.onLocationChanged
          .listen((LocationData currentLocation) async {
        callback(currentLocation);
      });
    }
  }

  Future<bool> _statusGPSPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool("com.check.gpsPermission");
    return value ?? false;
  }

  _saveStatusGPSPermission(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("com.check.gpsPermission", status);
  }

  dispose() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
  }
}
