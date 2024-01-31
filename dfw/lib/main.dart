import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'base/app/route_delegate.dart';
import 'base/extensions/themes.dart';

import 'base/routes/fluro.dart';

void main() async {
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
  late SinglePageAppRouterDelegate delegate;
  final _colors = [1, 2, 3, 4, 5];
  @override
  void initState() {
    super.initState();
    delegate = SinglePageAppRouterDelegate(colors: _colors);
    // Fluro.setupRouter();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      // routeInformationParser: parser,
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
