import 'package:flutter/material.dart';

import 'color_code.dart';
import 'landing_page.dart';
import 'route_configuration.dart';

class SinglePageAppRouterDelegate
    extends RouterDelegate<SinglePageAppConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SinglePageAppConfiguration> {
  final List<int> colors;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _homePage;

  // App state fields
  final ValueNotifier<int> _colorCodeNotifier = ValueNotifier(0);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  int get defaultColorCode => colors.first;

  SinglePageAppRouterDelegate({required this.colors}) {
    _homePage = MaterialPage(
        key: ValueKey<String>("HomePage"),
        child: LandingPage(
          page: '$_colorCodeNotifier',
        ));
    Listenable.merge([
      _colorCodeNotifier,
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
        colorCode: _colorCodeNotifier.value,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorCode = _colorCodeNotifier.value;
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
              _homePage,
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
      _colorCodeNotifier.value = 0;
    } else if (configuration.isHomePage) {
      _unknownStateNotifier.value = false;
      _colorCodeNotifier.value = ColorCode(
        hexColorCode: configuration.colorCode ?? defaultColorCode,
        source: ColorCodeSelectionSource.fromBrowserAddressBar,
      ) as int;
    }
  }
}
