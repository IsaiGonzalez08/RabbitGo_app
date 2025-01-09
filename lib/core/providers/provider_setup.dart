import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rabbit_go/core/providers/location_provider.dart';

List<SingleChildWidget> providers() {
  List<SingleChildWidget> providers = [
    Provider.value(value: LocationProvider()),
  ];
  return providers;
}
