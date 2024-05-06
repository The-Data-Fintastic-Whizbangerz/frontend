import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'route_type.dart';

class RouteInitial extends Equatable {
  final RouteType type;
  final RouteLevel level;
  final Widget? widget;

  RouteInitial({
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
}

enum RouteStatus { public, protected, private }

enum RouteFloor { ground, first, second, third }

class RouteLevel extends Equatable {
  final RouteStatus status;
  final RouteFloor floor;

  const RouteLevel({required this.status, required this.floor});

  static get guest =>
      const RouteLevel(status: RouteStatus.public, floor: RouteFloor.first);
  static get reglog =>
      const RouteLevel(status: RouteStatus.protected, floor: RouteFloor.first);
  static get account =>
      const RouteLevel(status: RouteStatus.private, floor: RouteFloor.first);

  @override
  String toString() => 'RouteLevel($status, $floor)';

  @override
  // TODO: implement props
  List<Object?> get props => [status, floor];
}
