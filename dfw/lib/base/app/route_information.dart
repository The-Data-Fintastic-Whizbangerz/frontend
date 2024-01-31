import 'package:flutter/material.dart';

import 'route_configuration.dart';

class SinglePageAppRouteInformationParser
    extends RouteInformationParser<SinglePageAppConfiguration> {
  final List<String> routes;

  SinglePageAppRouteInformationParser({required this.routes});

  @override
  Future<SinglePageAppConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.length == 0) {
      return SinglePageAppConfiguration.home();
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      // final second = uri.pathSegments[1].toLowerCase();
      if (_isValidPath(first)) {
        return SinglePageAppConfiguration.home(path: first);
      } else {
        return SinglePageAppConfiguration.unknown();
      }
    } else {
      return SinglePageAppConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(
      SinglePageAppConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isPage) {
      return RouteInformation(
        location:
            configuration.path == null ? '/' : '/colors/${configuration.path}',
      );
    } else {
      return null;
    }
  }

  bool _isValidPath(String path) {
    return routes.contains("$path");
  }
}
