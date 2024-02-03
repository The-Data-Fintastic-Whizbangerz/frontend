import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'route_code.dart';
import 'landing_page.dart';
import 'route_configuration.dart';

class SinglePageAppRouterDelegate
    extends RouterDelegate<SinglePageAppConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SinglePageAppConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _foundationPage;

  // App state fields
  final List<String> routes;
  final ValueNotifier<RouteCode?> _routeNotifier = ValueNotifier(null);
  final List<String> reglog;
  final ValueNotifier<RouteCode?> _reglogNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultRouteCode => routes.first;

  SinglePageAppRouterDelegate({required this.reglog, required this.routes}) {
    _foundationPage = MaterialPage(
        key: ValueKey<String>("HomePage"),
        child: HomeScreen(
          routes: routes,
          routeNotifier: _routeNotifier,
          reglog: reglog,
          reglogNotifier: _reglogNotifier,
        ));
    Listenable.merge([_routeNotifier, _reglogNotifier])
      ..addListener(() {
        print("notifying the router widget");
        notifyListeners();
      });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  SinglePageAppConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return SinglePageAppConfiguration.unknown();
    } else if (_reglogNotifier.value != null) {
      return SinglePageAppConfiguration.reglog(
          reglog: _reglogNotifier.value?.pathCode);
    } else {
      return SinglePageAppConfiguration.home(
          path: _routeNotifier.value?.pathCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeCode = _routeNotifier.value;
    final reglogCode = _reglogNotifier.value;
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              MaterialPage(
                key: ValueKey<String>("Unknown"),
                child: Container(),
              )
            ]
          : [
              _foundationPage,
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(SinglePageAppConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _routeNotifier.value = null;
      _reglogNotifier.value = null;
    } else if (configuration.isPage) {
      _unknownStateNotifier.value = false;
      _routeNotifier.value = RouteCode(
        pathCode: configuration.path ?? defaultRouteCode,
        source: RouteSelectionSource.fromBrowserAddressBar,
      );
      _reglogNotifier.value == null;
    } else if (configuration.isReglog) {
      _unknownStateNotifier.value = false;
      _reglogNotifier.value = RouteCode(
        pathCode: configuration.path ?? 'signin',
        source: RouteSelectionSource.fromBrowserAddressBar,
      );
      _routeNotifier.value = null;
    }
  }
}
