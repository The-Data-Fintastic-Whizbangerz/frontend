import 'package:flutter/material.dart';

class ConstructionPage extends StatelessWidget {
  const ConstructionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sorry!!!\nThis page is still under construction',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
