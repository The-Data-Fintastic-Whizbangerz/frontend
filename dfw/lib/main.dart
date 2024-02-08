import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'pages/product/loan_page.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'base/routes/route_delegate.dart';
import 'base/routes/route_information.dart';
import 'base/routes/route_initial.dart';
import 'pages/about/about_page.dart';
import 'pages/contact/contact_page.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'pages/guide/guide_page.dart';
import 'pages/home_page.dart';
import 'pages/news/news_page.dart';
import 'pages/product/product_page.dart';
import 'pages/signin/signin_page.dart';
import 'pages/signup/signup_page.dart';

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
  final _guest = ['home', 'products', 'guides', 'news', 'about'];
  final _reglog = ['login', 'register', 'signout'];
  @override
  void initState() {
    super.initState();
    delegate = RouteDelegate(guests: _guest, reglog: _reglog);
    parser = RouteParser(guests: _guest, reglog: _reglog);
    // Fluro.setupRouter();

    print(test[1].floor);
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

List<RouteInitial> test = [
  RouteInitial(
    'home',
    RouteCategory.home,
    HomePage(),
    null,
  ),
  RouteInitial(
    'products',
    RouteCategory.products,
    ProductWidget(),
    null,
  ),
  RouteInitial(
    'borrowing-calculator',
    RouteCategory.products,
    LoanPage(),
    null,
  ),
  RouteInitial(
    'guides',
    RouteCategory.guides,
    GuidePage(),
    null,
  ),
  RouteInitial(
    'news',
    RouteCategory.news,
    NewsPage(),
    null,
  ),
  RouteInitial(
    'about',
    RouteCategory.about,
    AboutPage(),
    null,
  ),
  RouteInitial(
    'contact',
    RouteCategory.contact,
    ContactPage(),
    null,
  ),
  RouteInitial(
    'login',
    RouteCategory.login,
    SignInWidget(),
    null,
  ),
  RouteInitial(
    'register',
    RouteCategory.register,
    SignUpPage(),
    null,
  ),
  RouteInitial(
    'dashboard',
    RouteCategory.dashboard,
    DashboardPage(),
    null,
  ),
];
