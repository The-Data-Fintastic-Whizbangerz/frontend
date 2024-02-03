import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../../pages/signin/signin_page.dart';
import '../../pages/signup/signup_page.dart';
import '../routes/constants.dart';
import '../utils/authentications/auth_bloc.dart';
import '../utils/states/status.dart';
import '../menus/bottom_menu.dart';
import '../menus/drawer_menu.dart';
import '../menus/rail_menu.dart';
import '../menus/signin_menu.dart';
import '../menus/signout_menu.dart';
import '../menus/top_menu.dart';
import '../extensions/responsiveWidget.dart';

class LandingPage extends StatefulWidget {
  final String page;
  final String? extra;
  final String? type;
  const LandingPage({
    Key? key,
    required this.page,
    this.extra,
    this.type,
  }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

bool isAuth = false;
User? user;

List<RouteConst> authRoutes = [
  RouteConst.SIGNIN_PAGE,
  RouteConst.SIGNUP_PAGE,
  RouteConst.SIGNOUT_PAGE,
];

List<RouteConst> guestRoutes = [
  RouteConst.HOME_PAGE,
  RouteConst.CALCULATOR_PAGE,
  RouteConst.GUIDES_PAGE,
  RouteConst.ABOUT_PAGE,
];

List<RouteConst> verifiedRoutes = [
  RouteConst.DASHBOARD_PAGE,
  RouteConst.PROFILE_PAGE,
  RouteConst.SETTING_PAGE,
];

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          setState(() {
            isAuth = state.status is StatusAuthenticated;
          });
          // if (state.status is StatusAuthenticated) {
          //   print('Status -> Landing: ' + state.status.toString());
          //   user = User(username: state.username, password: state.password);
          // }
          // if (state.status is StatusUnauthenticated) {
          //   print('Status -> Landing: ' + state.status.toString());
          //   user = null;
          // }
        },
        builder: (BuildContext context, AuthState state) {
          print('Status -> Landing: ' + state.status.toString());
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            bottomNavigationBar: (ResponsiveWidget.isMobile(context) && isAuth)
                ? BottomMenu(page: widget.page)
                : null,
            appBar: AppBar(
              automaticallyImplyLeading:
                  (ResponsiveWidget.isMobile(context)) ? true : false,
              title: (ResponsiveWidget.isMobile(context))
                  ? SizedBox(
                      height: 60, child: Image.asset('images/cthtc-logo.jpg'))
                  : null,
              leading: (ResponsiveWidget.isMobile(context))
                  ? null
                  : Image.asset('images/cthtc-logo.jpg'),
              actions: ResponsiveWidget.isMobile(context)
                  ? null
                  : [
                      TopMenu(page: widget.page),
                      isAuth
                          ? SignOutMenu(isExpanded: false)
                          : SignInMenu(isExpanded: false)
                    ],
            ),
            drawer: ResponsiveWidget.isMobile(context)
                ? DrawerMenu(page: widget.page)
                : null,
            body: SafeArea(
              child: Row(
                children: [
                  if (ResponsiveWidget.isTablet(context) && isAuth)
                    RailMenu(
                      page: widget.page,
                      isExpanded: false,
                    ),
                  if (ResponsiveWidget.isDesktop(context) && isAuth)
                    RailMenu(
                      page: widget.page,
                      isExpanded: true,
                    ),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: IndexedStack(
                        index: (verifiedRoutes + guestRoutes + authRoutes)
                            .map((route) => route.path)
                            .toList()
                            .indexOf(widget.page),
                        children: [
                          for (var page in verifiedRoutes) ...[page.widget],
                          for (var page in guestRoutes) ...[page.widget],
                          for (var page in authRoutes) ...[page.widget],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
