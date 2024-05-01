import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/states/status.dart';
import 'route_configuration.dart';
import 'route_initial.dart';
import 'route_type.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(RouteState()) {
    on<RouteEvent>((event, emit) {
      if (event is Guest_RouteEvent) {
        emit(Guest_RouteState(
            routes: event.guests,
            status: StatusSucess(),
            notifier: event.notifier));
      }
      if (event is Reglog_RouteEvent) {
        emit(Reglog_RouteState(
            notifier: event.notifier,
            routes: event.reglogs,
            status: StatusSucess()));
      }
      if (event is Product_RouteEvent) {
        emit(Product_RouteState(
            result: event.result,
            notifier: event.notifier,
            status: StatusSucess()));
      }
    });
  }
}
