import 'package:flutter/material.dart';

import '../test/test_page.dart';

class DashboardTablet extends StatelessWidget {
  const DashboardTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestPage(),
      // body: Center(child: Text('Dashboard Tablet')),
    );
  }
}
