import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rabbit_go/core/providers/location_provider.dart';

class HomeVM extends ChangeNotifier with WidgetsBindingObserver {
  final LocationProvider locationProvider;
  final Function showPermissionSheet;

  HomeVM({required this.locationProvider, required this.showPermissionSheet});

  bool? _locationPermissionEnabled;
  bool _loadingPermission = true;
  LatLng? _currentLocation;
  GoogleMapController? _mapController;
  StreamSubscription? _subscription;

  bool? get locationPermissionEnabled => _locationPermissionEnabled;
  bool get loadingPermission => _loadingPermission;
  LatLng? get currentLocation => _currentLocation;

  void initialise() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    locationProvider.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        _setupLocation();
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      default:
        break;
    }
  }

  init() async {
    await _setupLocation();
  }

  validateLocationPermissions() async {
    bool statusPermission = await locationProvider.askLocationPermission();
    if (statusPermission) {
      _locationPermissionEnabled = true;
      notifyListeners();

      if (_currentLocation == null) {
        LocationData? location = await locationProvider.getLocation();
        if (location != null) {
          _currentLocation =
              LatLng(location.latitude ?? 0, location.longitude ?? 0);
          notifyListeners();
        }
        _startUpdatingLocation();
      }
    } else {
      _locationPermissionEnabled = false;
      showPermissionSheet();
      notifyListeners();
    }
  }

  _setupLocation() async {
    if (_locationPermissionEnabled == null ||
        _locationPermissionEnabled == false) {
      _loadingPermission = true;
      notifyListeners();
    }
    await validateLocationPermissions();
    _loadingPermission = false;
    notifyListeners();
  }

  _startUpdatingLocation() {
    locationProvider.startUpdatingLocation((location) {
      LatLng? lastLocation = _currentLocation;
      _currentLocation =
          LatLng(location.latitude ?? 0, location.longitude ?? 0);
      if (lastLocation == null) {
        notifyListeners();
      }
    });
  }

  _centerUserLocation() {
    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(
            _currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0),
        17.0));
  }

  updateController(GoogleMapController googleMapController) {
    _mapController = googleMapController;
    _centerUserLocation();
  }

  onLocationDisabled() {
    AppSettings.openAppSettings(type: AppSettingsType.location);
  }
}
