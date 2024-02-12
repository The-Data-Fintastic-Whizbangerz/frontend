import 'package:flutter/material.dart';

class UnknownPage extends Page {
  UnknownPage() : super(key: ValueKey('UnknownPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return ErrorPage(
            title: 'Unknown Page',
          );
        });
  }
}

class ErrorPage extends StatelessWidget {
  final String? title;
  const ErrorPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title!),
            TextButton(
              onPressed: () {},
              child: Text('Go to homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
