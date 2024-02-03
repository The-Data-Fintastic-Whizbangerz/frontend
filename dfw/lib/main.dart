import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'base/app/route_delegate.dart';
import 'base/app/route_information.dart';
import 'base/extensions/themes.dart';

import 'base/routes/fluro.dart';

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
  late SinglePageAppRouterDelegate delegate;
  late SinglePageAppRouteInformationParser parser;
  final _routes = ['home', 'products', 'guides', 'about'];
  final _reglog = ['signin', 'signup'];
  @override
  void initState() {
    super.initState();
    delegate = SinglePageAppRouterDelegate(routes: _routes, reglog: _reglog);
    parser =
        SinglePageAppRouteInformationParser(routes: _routes, reglog: _reglog);
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
