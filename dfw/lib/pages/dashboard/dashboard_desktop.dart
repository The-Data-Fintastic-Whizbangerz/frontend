import 'package:flutter/material.dart';
import '/pages/test/test_page.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestPage(),
      // body: Text('Dashboard Desktop'),
    );
  }
}
