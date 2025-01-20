import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/ui/adapters/route_adapter.dart';
import 'package:rabbit_go/viewmodels/home_routes_popup_vm.dart';
import 'package:stacked/stacked.dart';

class HomeRoutesPopup extends StatefulWidget {
  const HomeRoutesPopup({super.key});

  @override
  State<HomeRoutesPopup> createState() => _HomeRoutesPopupState();
}

class _HomeRoutesPopupState extends State<HomeRoutesPopup> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeRoutesPopupVM(),
        builder: (context, homeRoutesPopupVM, child) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _txtTitle(),
                      _txtStopDirection(),
                      _txtSubtitle(),
                    ],
                  ),
                ),
                _routesList()
              ],
            ),
          );
        });
  }

  Widget _txtTitle() {
    return Text(
      'ascent_descent_stops'.translate(context),
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: RabbitGoColors.primaryColor),
    );
  }

  Widget _txtStopDirection() {
    return Text(
      '[Dirección de la parada de ascenso y descenso].',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: RabbitGoColors.primaryColor),
    );
  }

  Widget _txtSubtitle() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Text(
        'boarding_routes'.translate(context),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: RabbitGoColors.primaryColor),
      ),
    );
  }

  Widget _routesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return RouteAdapter(
            route: 'Ruta ${51 + index}',
            startTime: '10:00',
            endTime: '22:00',
          );
        },
      ),
    );
  }
}
