import 'package:flutter/material.dart';

import 'package:The_Data_Fintastic_Whizbangerz_Group/base/app/page_sections.dart';

import 'menu_top.dart';
import 'route_code.dart';

class HomeScreen extends StatelessWidget {
  final List<String> routes;
  final ValueNotifier<RouteCode?> routeNotifier;
  final List<String> reglog;
  final ValueNotifier<RouteCode?> reglogNotifier;

  HomeScreen({
    Key? key,
    required this.routes,
    required this.routeNotifier,
    required this.reglog,
    required this.reglogNotifier,
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
            reglog: reglog,
            reglogNotifier: reglogNotifier,
          ),
          Expanded(
            child: RouteSections(
              routes: routes,
              routeNotifier: routeNotifier,
              reglog: reglog,
              reglogNotifier: reglogNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
