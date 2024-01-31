import 'package:The_Data_Fintastic_Whizbangerz_Group/base/app/page_sections.dart';

import 'menu_top.dart';
import 'route_code.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> routes;
  final ValueNotifier<RouteCode?> routeNotifier;

  HomeScreen({
    Key? key,
    required this.routes,
    required this.routeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          TopNavigationMenu(
            routes: routes,
            routeNotifier: routeNotifier,
          ),
          Expanded(
            child: RouteSections(
              routes: routes,
              routeNotifier: routeNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
