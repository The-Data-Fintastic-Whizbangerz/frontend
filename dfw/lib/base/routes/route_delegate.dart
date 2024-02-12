import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/error/error_page.dart';
import '../../pages/product/product_page.dart';
import 'package:flutter/material.dart';
import '../app/landing_page.dart';
import 'route_bloc.dart';
import 'route_initial.dart';
import 'route_type.dart';
import 'route_configuration.dart';

class RouteDelegate extends RouterDelegate<RouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _foundationPage;

  // App state fields
  final ValueNotifier<RouteType?> _guestNotifier = ValueNotifier(null);
  final ValueNotifier<RouteType?> _productNotifier = ValueNotifier(null);
  final ValueNotifier<RouteType?> _reglogNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownNotifier = ValueNotifier(null);

  final List<RouteInitial> routes;

  // String get defaultRouteCode => guests.first;
  // String get defaultReglogPath => reglog.first;

  RouteDelegate({required this.routes}) {
    final test_guest =
        routes.where((route) => route.level == RouteLevel.guest).toList();
    final test_reglog =
        routes.where((route) => route.level == RouteLevel.reglog).toList();
    final test_account =
        routes.where((route) => route.level == RouteLevel.account).toList();
    final test_product = routes
        .where((route) => (route.level.floor == RouteFloor.second))
        .toList();
    print(test_reglog);

    _foundationPage = MaterialPage(
        key: ValueKey<String>("HomePage"),
        child: BlocProvider(
          create: (context) => RouteBloc()
            ..add(Guest_RouteEvent(
              guests: test_guest.map((guest) => guest.type).toList(),
              notifier: _guestNotifier,
            ))
            ..add(Reglog_RouteEvent(
              reglogs: test_reglog.map((reglog) => reglog.type).toList(),
              notifier: _reglogNotifier,
            )),
          child: BlocConsumer<RouteBloc, RouteState>(
            listener: (context, state) {
              if (state is Guest_RouteState) {
                print('DELEGATE guest: ${state.notifier}');
              }
              if (state is Reglog_RouteState) {
                print('DELEGATE reg: ${state.notifier}');
              }
            },
            builder: (context, state) {
              return LandingPage(
                productNotifier: _productNotifier,
              );
            },
          ),
        ));
    Listenable.merge([
      _guestNotifier,
      _reglogNotifier,
      _productNotifier,
    ]).addListener(() {
      print("notifying the router widget");
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  RouteConfiguration get currentConfiguration {
    if (_unknownNotifier.value == true) {
      return RouteConfiguration.unknown();
    } else if (_reglogNotifier.value != null) {
      return RouteConfiguration.reglog(reglogPath: _reglogNotifier.value?.path);
    } else if (_productNotifier.value != null) {
      return RouteConfiguration.product(
          productPath: _productNotifier.value?.path);
    } else {
      return RouteConfiguration.guest(guestPath: _guestNotifier.value?.path);
    }
  }

  List<Page> get _unknownStack => [UnknownPage()];

  @override
  Widget build(BuildContext context) {
    // List<Page> stack;

    return Navigator(
      key: navigatorKey,
      pages: _unknownNotifier.value == true
          ? _unknownStack
          : [
              _foundationPage,
            ],
      onPopPage: (route, result) {
        print('pop' + route.settings.name.toString());
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) async {
    // print('>>>${configuration.guestPath}/${configuration.productPath}');
    // print('>>>${configuration.isProductsPage}');
    if (configuration.unknown) {
      _unknownNotifier.value = true;
      _guestNotifier.value = null;
      _productNotifier.value = null;
      _reglogNotifier.value = null;
    } else if (configuration.isPage) {
      _unknownNotifier.value = false;
      _guestNotifier.value = RouteType(
        path: configuration.guestPath ?? '/',
        source: RouteSource.fromAddress,
      );
      _productNotifier.value = null;
      _reglogNotifier.value == null;
    } else if (configuration.isProductsPage) {
      print('product page >>>');
      _unknownNotifier.value = false;
      _guestNotifier.value = null;
      _productNotifier.value = RouteType(
        path: '${configuration.productPath}',
        source: RouteSource.fromAddress,
      );
      _reglogNotifier.value == null;
    } else if (configuration.isReglog) {
      _unknownNotifier.value = false;
      _reglogNotifier.value = RouteType(
        path: '${configuration.reglogPath}',
        source: RouteSource.fromAddress,
      );
      _guestNotifier.value = null;
      _productNotifier.value = null;
    }
  }
}
