part of 'route_bloc.dart';

class RouteState extends Equatable {
  final List<RouteType> routes;
  final Status status;

  RouteState({
    this.routes = const [],
    this.status = const StatusInitial(),
  });

  @override
  List<Object> get props => [];

  RouteState copyWith({
    List<RouteType>? routes,
    Status? status,
  }) {
    return RouteState(
      routes: routes ?? this.routes,
      status: status ?? this.status,
    );
  }
}

class Guest_RouteState extends RouteState {
  final ValueNotifier<RouteType?> notifier;
  Guest_RouteState({required this.notifier, super.routes, super.status});
}

class Reglog_RouteState extends RouteState {
  final ValueNotifier<RouteType?> notifier;
  Reglog_RouteState({required this.notifier, super.routes, super.status});
}

class Home_RouteState extends RouteState {
  final PageController controller;
  Home_RouteState({required this.controller, super.routes, super.status});
}

class Guide_RouteState extends RouteState {
  // final ValueNotifier<RouteType?> notifier;
  final int crossAxisCount;
  Guide_RouteState({required this.crossAxisCount, super.routes, super.status});
}

class Product_RouteState extends RouteState {
  final ValueNotifier<RouteType?> notifier;
  final double result;
  Product_RouteState({
    required this.notifier,
    required this.result,
    super.routes,
    super.status,
  });
}
