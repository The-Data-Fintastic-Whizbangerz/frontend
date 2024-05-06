import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/error/error_page.dart';
import '../app/landing_page.dart';
import 'route_bloc.dart';
import 'route_configuration.dart';
import 'route_initial.dart';
import 'route_type.dart';

class RouteDelegate extends RouterDelegate<RouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _foundationPage;

  // App state fields
  final ValueNotifier<RouteType?> _guestNotifier = ValueNotifier(null);
  final ValueNotifier<RouteType?> _reglogNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownNotifier = ValueNotifier(null);

  final List<RouteInitial> routes;

  RouteDelegate({required this.routes}) {
    final level_guest =
        routes.where((route) => route.level == RouteLevel.guest).toList();
    final test_reglog =
        routes.where((route) => route.level == RouteLevel.reglog).toList();

    _foundationPage = MaterialPage(
        key: ValueKey<String>("HomePage"),
        child: BlocProvider(
          create: (context) => RouteBloc()
            ..add(Guest_RouteEvent(
              guests: level_guest.map((guest) => guest.type).toList(),
              notifier: _guestNotifier,
            ))
            ..add(Reglog_RouteEvent(
              reglogs: test_reglog.map((reglog) => reglog.type).toList(),
              notifier: _reglogNotifier,
            )),
          child: BlocConsumer<RouteBloc, RouteState>(
            listener: (context, state) {
              // if (state is Guest_RouteState) {
              //   print('DELEGATE guest: ${state.notifier}');
              // }
              // if (state is Reglog_RouteState) {
              //   print('DELEGATE reg: ${state.notifier}');
              // }
            },
            builder: (context, state) {
              return LandingPage();
            },
          ),
        ));
    Listenable.merge([
      _guestNotifier,
      _reglogNotifier,
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
    } else {
      return RouteConfiguration.guest(guestPath: _guestNotifier.value?.path);
    }
  }

  List<Page> get _unknownStack => [UnknownPage()];

  @override
  Widget build(BuildContext context) {
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
    if (configuration.unknown) {
      _unknownNotifier.value = true;
      _guestNotifier.value = null;
      _reglogNotifier.value = null;
    } else if (configuration.isPage) {
      _unknownNotifier.value = false;
      _guestNotifier.value = RouteType(
        path: configuration.guestPath ?? '/',
        source: RouteSource.fromAddress,
      );
      _reglogNotifier.value == null;
    } else if (configuration.isProductsPage) {
      print('product page >>>');
      _unknownNotifier.value = false;
      _guestNotifier.value = RouteType(
        path: '${configuration.guestPath}',
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
    }
  }
}
