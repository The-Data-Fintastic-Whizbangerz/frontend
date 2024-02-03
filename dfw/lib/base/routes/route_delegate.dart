import 'package:flutter/material.dart';
import '../app/landing_page.dart';
import 'route_type.dart';
import 'route_configuration.dart';

class RouteDelegate extends RouterDelegate<RouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _foundationPage;

  // App state fields
  final List<String> guests;
  final ValueNotifier<RouteType?> _guestNotifier = ValueNotifier(null);
  final List<String> reglog;
  final ValueNotifier<RouteType?> _reglogNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultRouteCode => guests.first;
  String get defaultReglogPath => reglog.first;

  RouteDelegate({required this.reglog, required this.guests}) {
    _foundationPage = MaterialPage(
        key: ValueKey<String>("HomePage"),
        child: LandingPage(
          guests: guests,
          guestNotifier: _guestNotifier,
          reglog: reglog,
          reglogNotifier: _reglogNotifier,
        ));
    Listenable.merge([_guestNotifier, _reglogNotifier])
      ..addListener(() {
        print("notifying the router widget");
        notifyListeners();
      });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  RouteConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return RouteConfiguration.unknown();
    } else if (_reglogNotifier.value != null) {
      return RouteConfiguration.reglog(reglogPath: _reglogNotifier.value?.path);
    } else {
      return RouteConfiguration.guest(guestPath: _guestNotifier.value?.path);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        print('pop' + result.toString());
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _guestNotifier.value = null;
      _reglogNotifier.value = null;
    } else if (configuration.isPage) {
      _unknownStateNotifier.value = false;
      _guestNotifier.value = RouteType(
        path: configuration.guestPath ?? defaultRouteCode,
        source: RouteSelectionSource.fromBrowserAddressBar,
      );
      _reglogNotifier.value == null;
    } else if (configuration.isReglog) {
      _unknownStateNotifier.value = false;
      _reglogNotifier.value = RouteType(
        path: configuration.reglogPath ?? defaultReglogPath,
        source: RouteSelectionSource.fromBrowserAddressBar,
      );
      _guestNotifier.value = null;
    }
  }
}
