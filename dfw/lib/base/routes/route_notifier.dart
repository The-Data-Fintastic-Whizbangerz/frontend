import 'package:The_Data_Fintastic_Whizbangerz_Group/base/routes/route_type.dart';
import 'package:flutter/material.dart';

class RouteNotifier extends ChangeNotifier {
  String _path;
  RouteNotifier() : _path = '';

  String get selectedPath => _path;

  set selectedPath(String path) {
    _path = path;
    notifyListeners();
  }

  RouteType get selectedRoute {
    return RouteType(path: selectedPath);
  }

  // _set(RouteType newValue) {
  //   if (newValue != value) {
  //     value = newValue;
  //     notifyListeners();
  //   }
  // }

  // Future<void> setRoute(RouteType value) async {
  //   _set(value);
  // }
}
