import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'base/routes/route_delegate.dart';
import 'base/routes/route_information.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // final AppRouter? routers;
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late RouteDelegate delegate;
  late RouteParser parser;
  final _guest = ['home', 'products', 'guides', 'about'];
  final _reglog = ['signin', 'signup'];
  @override
  void initState() {
    super.initState();
    delegate = RouteDelegate(guests: _guest, reglog: _reglog);
    parser = RouteParser(guests: _guest, reglog: _reglog);
    // Fluro.setupRouter();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Credit Scoring - CTHTC',
    //   theme: NeumorphismTheme.lightTheme(),
    //   darkTheme: NeumorphismTheme.darkTheme(),
    //   initialRoute: '/home',
    //   onGenerateRoute: Fluro.router.generator,
    // );
  }
}
