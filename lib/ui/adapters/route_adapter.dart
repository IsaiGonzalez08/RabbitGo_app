import 'package:flutter/material.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';

class RouteAdapter extends StatelessWidget {
  final String route;
  final String startTime;
  final String endTime;

  const RouteAdapter(
      {super.key,
      required this.route,
      required this.startTime,
      required this.endTime});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: RabbitGoColors.secondaryColor[100]!,
          width: 1,
        ))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: [
              Image.asset(
                'assets/images/route.png',
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      route,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: RabbitGoColors.primaryColor),
                    ),
                    Text(
                      '$startTime - $endTime',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: RabbitGoColors.secondaryColor[300]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
