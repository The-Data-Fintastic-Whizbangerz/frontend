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

  // int getCurrent(List<RouteType> s1, RouteType? s2) {
  //   int index = s1.indexWhere((element) => element.path == s2?.path);
  //   return index > -1 ? index : 0;
  // }
}

class Reglog_RouteState extends RouteState {
  final ValueNotifier<RouteType?> notifier;
  Reglog_RouteState({required this.notifier, super.routes, super.status});
}
