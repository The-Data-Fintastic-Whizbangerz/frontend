import 'package:flutter/material.dart';

import '../test/test_page.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestPage(),
      // body: Center(child: Text('Dashboard Mobile')),
    );
  }
}
