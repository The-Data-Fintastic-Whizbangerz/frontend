import '../app/page_sections.dart';
import 'package:flutter/material.dart';

import '../extensions/themes.dart';
import '../menus/menu_top.dart';
import '../routes/route_type.dart';

class LandingPage extends StatelessWidget {
  final List<String> guests;
  final ValueNotifier<RouteType?> guestNotifier;
  final List<String> reglog;
  final ValueNotifier<RouteType?> reglogNotifier;

  LandingPage({
    Key? key,
    required this.guests,
    required this.guestNotifier,
    required this.reglog,
    required this.reglogNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              BasicTheme.leftBackground,
              BasicTheme.rightBackground,
              BasicTheme.leftBackground,
              BasicTheme.rightBackground,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.3, 0.8, 1],
          ),
        ),
        child: Column(
          children: [
            TopNavigationMenu(
              guests: guests,
              guestNotifier: guestNotifier,
              reglog: reglog,
              reglogNotifier: reglogNotifier,
            ),
            Expanded(
              child: PageSection(
                guests: guests,
                guestNotifier: guestNotifier,
                reglog: reglog,
                reglogNotifier: reglogNotifier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
