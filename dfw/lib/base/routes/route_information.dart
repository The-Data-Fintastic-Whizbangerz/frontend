import 'package:flutter/material.dart';

import 'route_configuration.dart';

class RouteParser extends RouteInformationParser<RouteConfiguration> {
  final List<String> guests;
  final List<String> reglog;

  RouteParser({required this.reglog, required this.guests});

  @override
  Future<RouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.isEmpty) {
      return RouteConfiguration.guest();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      if (reglog.contains(first)) {
        return RouteConfiguration.reglog(reglogPath: first);
      } else if (guests.contains(first)) {
        return RouteConfiguration.guest(guestPath: first);
      } else {
        return RouteConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 2) {
      print('information');
      final first = uri.pathSegments[0].toLowerCase();
      // print(first);
      final second = uri.pathSegments[1].toLowerCase();
      // print(second);
      if (first == 'products') {
        return RouteConfiguration.guest(guestPath: 'products/$second');
      } else {
        return RouteConfiguration.unknown();
      }
    } else {
      return RouteConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RouteConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isPage) {
      print('configuration.isPage');
      return RouteInformation(
        location: '/${configuration.guestPath}',
      );
    } else if (configuration.isReglog) {
      print('configuration.isReglog');
      return RouteInformation(
        location: '/${configuration.reglogPath}',
      );
    } else if (configuration.isProductsPage) {
      print('configuration.isProductsPage');
      return RouteInformation(location: '/${configuration.guestPath}');
    } else {
      return null;
    }
  }
}
