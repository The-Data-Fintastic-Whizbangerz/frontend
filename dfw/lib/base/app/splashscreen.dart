import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.pushNamed(context, '/home');
    });
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.asset(
            'images/cthtc-logo.jpg',
            scale: 2,
            // fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
