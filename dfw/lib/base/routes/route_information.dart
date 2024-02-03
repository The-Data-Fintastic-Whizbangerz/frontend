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
    } else {
      return RouteConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RouteConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isPage) {
      return RouteInformation(
        location: '/${configuration.guestPath}',
      );
    } else if (configuration.isReglog) {
      return RouteInformation(
        location: '/${configuration.reglogPath}',
      );
    } else {
      return null;
    }
  }

  bool _isValidPath(String path) {
    return guests.contains("$path");
  }

  bool _isRegPath(String path) {
    return reglog.contains("$path");
  }
}
