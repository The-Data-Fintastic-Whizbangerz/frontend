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

class Product_RouteEvent extends RouteEvent {
  final ValueNotifier<RouteType?> notifier;
  final double result;

  Product_RouteEvent({
    required this.notifier,
    required this.result,
  });
}

class Guide_RouteEvent extends RouteEvent {
  final int crossAxisCount;

  Guide_RouteEvent({
    required this.crossAxisCount,
  });
}
