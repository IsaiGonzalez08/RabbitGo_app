import 'package:flutter/material.dart';
import 'package:rabbit_go/ui/controls/rabbitgo_textfield.dart';
import 'package:rabbit_go/viewmodels/find_place_vm.dart';
import 'package:stacked/stacked.dart';

class FindPlaceView extends StatefulWidget {
  const FindPlaceView({super.key});

  @override
  State<FindPlaceView> createState() => _FindPlaceViewState();
}

class _FindPlaceViewState extends State<FindPlaceView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FindPlaceVM>.reactive(
        viewModelBuilder: () => FindPlaceVM(context: context),
        builder: (context, findPlaceVM, child) {
          return Scaffold(
            body: _body(findPlaceVM),
          );
        });
  }

  Widget _body(FindPlaceVM findPlaceVM) {
    return Column(
      children: [_appBarWithFields(findPlaceVM)],
    );
  }

  Widget _appBarWithFields(FindPlaceVM findPlaceVM) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_imgLeading(), _columnFields(findPlaceVM)],
      ),
    );
  }

  Widget _imgLeading() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Image.asset(
        'assets/images/left_arrow.png',
        width: 30,
      ),
    );
  }

  Widget _columnFields(FindPlaceVM findPlaceVM) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _txtStart(findPlaceVM),
            _txtEnd(findPlaceVM)
          ],
        ),
      ),
    );
  }

  Widget _txtStart(FindPlaceVM findPlaceVM) {
    return RabbitgoTextfield(
        controller: findPlaceVM.startController,
        validator: findPlaceVM.validateField,
        hintText: '¿A donde quieres ir?',
        keyboardType: TextInputType.text);
  }

  Widget _txtEnd(FindPlaceVM findPlaceVM) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: RabbitgoTextfield(
          controller: findPlaceVM.endController,
          validator: findPlaceVM.validateField,
          hintText: '¿A donde quieres ir?',
          keyboardType: TextInputType.text),
    );
  }
}
