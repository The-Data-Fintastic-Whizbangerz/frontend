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
  final List<String> routes;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _foundationPage;

  // App state fields
  final ValueNotifier<RouteCode?> _routeNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultColorCode => routes.first;

  SinglePageAppRouterDelegate({required this.routes}) {
    _foundationPage = MaterialPage(
        key: ValueKey<String>("HomePage"),
        child: HomeScreen(
          routes: routes,
          routeNotifier: _routeNotifier,
        ));
    Listenable.merge([
      _routeNotifier,
    ])
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
    } else {
      return SinglePageAppConfiguration.home(
        path: _routeNotifier.value?.pathCode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeCode = _routeNotifier.value;
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
    } else if (configuration.isPage) {
      _unknownStateNotifier.value = false;
      _routeNotifier.value = RouteCode(
        pathCode: configuration.path ?? defaultColorCode,
        source: RouteSelectionSource.fromBrowserAddressBar,
      );
    }
  }
}
