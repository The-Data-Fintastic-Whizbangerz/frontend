import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'base/extensions/themes.dart';
import 'base/routes/route_delegate.dart';
import 'base/routes/route_information.dart';
import 'base/routes/route_repository.dart';

void main() {
  setPathUrlStrategy();
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
  final _guest = ['home', 'products', 'guides', 'news', 'about', 'contact'];
  final _reglog = ['login', 'register', 'signout'];
  @override
  void initState() {
    super.initState();
    delegate = RouteDelegate(routes: RouteRepository.routes);
    parser = RouteParser(guests: _guest, reglog: _reglog);
    // Fluro.setupRouter();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: BasicTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
