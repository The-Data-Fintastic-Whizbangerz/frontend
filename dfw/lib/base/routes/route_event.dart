part of 'route_bloc.dart';

sealed class RouteEvent extends Equatable {
  const RouteEvent();

  @override
  List<Object> get props => [];
}

class Guest_RouteEvent extends RouteEvent {
  final List<RouteType> guests;
  final ValueNotifier<RouteType?> notifier;
  Guest_RouteEvent({
    required this.guests,
    required this.notifier,
  });
}

class Reglog_RouteEvent extends RouteEvent {
  final List<RouteType> reglogs;
  final ValueNotifier<RouteType?> notifier;
  Reglog_RouteEvent({
    required this.reglogs,
    required this.notifier,
  });
}

class Account_RouteEvent extends RouteEvent {
  List<RouteType> accounts;
  Account_RouteEvent({
    required this.accounts,
  });
}
