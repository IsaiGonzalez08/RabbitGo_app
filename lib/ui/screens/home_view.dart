import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/common/utils/utilities.dart';
import 'package:rabbit_go/viewmodels/home_vm.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeVM>.reactive(
        onViewModelReady: (homeVM) => homeVM.init(),
        viewModelBuilder: () => HomeVM(
            locationProvider: Provider.of(context),
            showPermissionSheet: _showPermissionModal),
        builder: (context, homeVM, child) {
          return Scaffold(
              body: homeVM.locationPermissionEnabled == true
                  ? _map(homeVM)
                  : homeVM.loadingPermission
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _locationDisabled(homeVM));
        });
  }

  Widget _map(HomeVM homeVM) {
    return homeVM.currentLocation != null
        ? GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: homeVM.currentLocation!, zoom: 17),
            onMapCreated: (controller) => homeVM.updateController(controller))
        : const Center(
            child: CircularProgressIndicator(
              color: RabbitGoColors.primaryColor,
            ),
          );
  }

  Widget _locationDisabled(HomeVM homeVM) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "location_permission_disabled".translate(context),
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: RabbitGoColors.primaryColor),
        ),
        TextButton(
            onPressed: () => homeVM.onLocationDisabled(),
            child: Text(
              "press_to_enabled".translate(context),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: RabbitGoColors.primaryColor,
                  decoration: TextDecoration.underline),
            ))
      ],
    );
  }

  _showPermissionModal() {
    showModalSheet(context);
  }
}
