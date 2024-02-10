import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'route_type.dart';

class RouteInitial extends Equatable {
  final RouteType type;
  final RouteLevel level;
  final Widget? widget;

  const RouteInitial({
    required this.type,
    required this.level,
    this.widget,
  });

  @override
  List<Object?> get props {
    return [
      type,
      level,
      widget,
    ];
  }

  // List<RouteFloor> get floor {
  //   return category.item.values.single;
  // }
}

enum RouteState { public, protected, private }

enum RouteFloor { ground, first, second, third }

class RouteLevel extends Equatable {
  final RouteState state;
  final RouteFloor floor;

  RouteLevel({required this.state, required this.floor});

  static get guest =>
      RouteLevel(state: RouteState.public, floor: RouteFloor.first);
  static get reglog =>
      RouteLevel(state: RouteState.protected, floor: RouteFloor.first);
  static get account =>
      RouteLevel(state: RouteState.private, floor: RouteFloor.first);

  @override
  String toString() => 'RouteLevel($state, $floor)';

  @override
  // TODO: implement props
  List<Object?> get props => [state, floor];
}
