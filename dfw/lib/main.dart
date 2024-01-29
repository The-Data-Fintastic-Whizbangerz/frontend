import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'base/extensions/themes.dart';

import 'base/routes/fluro.dart';

void main() async {
  setPathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

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
  // @override
  // void initState() {
  //   super.initState();
  // }
  @override
  void initState() {
    super.initState();
    Fluro.setupRouter();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final navKey = new GlobalKey<NavigatorState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credit Scoring - CTHTC',
      theme: NeumorphismTheme.lightTheme(),
      darkTheme: NeumorphismTheme.darkTheme(),
      initialRoute: '/home',
      // onGenerateRoute: widget.routers!.generateRoute,
      onGenerateRoute: Fluro.router.generator,
      // onUnknownRoute: (_) {
      //   return MaterialPageRoute(
      //     builder: (context) => ErrorPage(),
      //   );
      // },
    );
  }
}
