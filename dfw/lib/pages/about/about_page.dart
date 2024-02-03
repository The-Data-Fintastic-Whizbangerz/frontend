import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('About Page'),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: _footer(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _footer() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(child: Text('Logo')),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(child: Text('Company')),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(child: Text('Pages')),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(child: Text('Terms & Conditions')),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(child: Text('Newsletter')),
          ),
        ),
      ],
    );
  }
}
