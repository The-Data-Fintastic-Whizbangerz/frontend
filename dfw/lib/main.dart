import 'package:The_Data_Fintastic_Whizbangerz_Group/base/routes/route_type.dart';
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
  final _guest = ['home', 'products', 'guides', 'news', 'about', 'contact'];
  final _reglog = ['login', 'register', 'signout'];
  @override
  void initState() {
    super.initState();
    delegate = RouteDelegate(guests: _guest, reglog: _reglog, routes: test);
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
  }
}

List<RouteInitial> test = [
  RouteInitial(
      type: RouteType(path: 'home'),
      level: RouteLevel.guest,
      widget: HomePage()),
  RouteInitial(
      type: RouteType(path: 'products'),
      level: RouteLevel.guest,
      widget: ProductWidget()),
  RouteInitial(
      type: RouteType(path: 'borrowing-calculator'),
      level: RouteLevel(status: RouteStatus.public, floor: RouteFloor.second),
      widget: LoanPage()),
  RouteInitial(
      type: RouteType(path: 'guides'),
      level: RouteLevel.guest,
      widget: GuidePage()),
  RouteInitial(
      type: RouteType(path: 'news'),
      level: RouteLevel.guest,
      widget: NewsPage()),
  RouteInitial(
      type: RouteType(path: 'about'),
      level: RouteLevel.guest,
      widget: AboutPage()),
  RouteInitial(
      type: RouteType(path: 'contact'),
      level: RouteLevel.guest,
      widget: ContactPage()),
  RouteInitial(
      type: RouteType(path: 'login'),
      level: RouteLevel.reglog,
      widget: SignInWidget()),
  RouteInitial(
      type: RouteType(path: 'register'),
      level: RouteLevel.reglog,
      widget: SignUpPage()),
  RouteInitial(
      type: RouteType(path: 'dashboard'),
      level: RouteLevel.account,
      widget: DashboardPage()),

  // RouteInitial(
  //   'borrowing-calculator',
  //   RouteCategory.products,
  //   LoanPage(),
  //   null,
  // ),
];
