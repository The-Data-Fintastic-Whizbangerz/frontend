import 'package:flutter/material.dart';

import '../app/page_sections.dart';
import '../extensions/themes.dart';
import '../menus/menu_top.dart';

class LandingPage extends StatelessWidget {
  LandingPage({
    Key? key,
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
        // need to set initial frame for each platform
        // constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            TopNavigationMenu(),
            Expanded(
              child: PageSection(),
            ),
          ],
        ),
      ),
    );
  }
}
