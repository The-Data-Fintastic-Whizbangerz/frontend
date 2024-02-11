part of 'route_bloc.dart';

sealed class RouteEvent extends Equatable {
  const RouteEvent();

  @override
  List<Object> get props => [];
}

class Guest_RouteEvent extends RouteEvent {
  final List<RouteInitial> guests;
  Guest_RouteEvent({
    required this.guests,
  });
}

class Reglog_RouteEvent extends RouteEvent {
  final List<RouteInitial> reglogs;
  Reglog_RouteEvent({
    required this.reglogs,
  });
}

class Account_RouteEvent extends RouteEvent {
  List<RouteInitial> accounts;
  Account_RouteEvent({
    required this.accounts,
  });
}
