import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/common/utils/utilities.dart';
import 'package:rabbit_go/ui/screens/find_place_view.dart';
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
            showPermissionSheet: _showPermissionModal,
            navigateToFindPlace: _navigateToFindPlace),
        builder: (context, homeVM, child) {
          return Scaffold(body: _body(homeVM));
        });
  }

  Widget _body(HomeVM homeVM) {
    return homeVM.locationPermissionEnabled == true
        ? Stack(
            children: [
              _map(homeVM),
              _btnSearchPlace(),
            ],
          )
        : homeVM.loadingPermission
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _locationDisabled(homeVM);
  }

  Widget _btnSearchPlace() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: MediaQuery.of(context).size.width * 0.04),
          width: double.infinity,
          height: 50,
          child: InkWell(
            onTap: () => _navigateToFindPlace(),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Icon(
                    LucideIcons.search,
                    color: RabbitGoColors.secondaryColor[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    'where_do_you_want_to_go'.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: RabbitGoColors.secondaryColor[300]),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _map(HomeVM homeVM) {
    return homeVM.currentLocation != null
        ? GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            buildingsEnabled: true,
            compassEnabled: false,
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

  _navigateToFindPlace() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FindPlaceView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  _showPermissionModal() {
    showModalSheet(context);
  }
}
