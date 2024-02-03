import 'package:flutter/material.dart';

import 'route_configuration.dart';

class SinglePageAppRouteInformationParser
    extends RouteInformationParser<SinglePageAppConfiguration> {
  final List<String> routes;
  final List<String> reglog;

  SinglePageAppRouteInformationParser(
      {required this.reglog, required this.routes});

  @override
  Future<SinglePageAppConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.isEmpty) {
      return SinglePageAppConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      if (reglog.contains(first)) {
        return SinglePageAppConfiguration.reglog(reglog: first);
      } else if (routes.contains(first)) {
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
        location: '/${configuration.path}',
      );
    } else if (configuration.isReglog) {
      return RouteInformation(
        location: '/${configuration.path}',
      );
    } else {
      return null;
    }
  }

  bool _isValidPath(String path) {
    return routes.contains("$path");
  }

  bool _isRegPath(String path) {
    return reglog.contains("$path");
  }
}