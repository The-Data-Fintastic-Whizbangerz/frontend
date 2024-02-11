part of 'route_bloc.dart';

class RouteState extends Equatable {
  final List<RouteInitial> routes;
  final Status status;

  const RouteState({
    this.routes = const [],
    this.status = const StatusInitial(),
  });

  @override
  List<Object> get props => [];

  RouteState copyWith({
    List<RouteInitial>? routes,
    Status? status,
  }) {
    return RouteState(
      routes: routes ?? this.routes,
      status: status ?? this.status,
    );
  }
}

class Guest_RouteState extends RouteState {
  const Guest_RouteState({super.routes, super.status});
}

class Reglog_RouteState extends RouteState {
  const Reglog_RouteState({super.routes, super.status});
}
