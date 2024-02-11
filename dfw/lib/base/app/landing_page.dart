import 'package:flutter/material.dart';

import '../../pages/product/product_page.dart';
import '../app/page_sections.dart';
import '../extensions/themes.dart';
import '../menus/menu_top.dart';
import '../routes/route_type.dart';

class LandingPage extends StatelessWidget {
  final ValueNotifier<RouteType?> productNotifier;

  LandingPage({
    Key? key,
    required this.productNotifier,
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
              productNotifier: productNotifier,
            ),
            Expanded(
              child: PageSection(
                productNotifier: productNotifier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
