import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/states/status.dart';
import 'route_initial.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(const RouteState()) {
    on<RouteEvent>((event, emit) {
      if (event is Guest_RouteEvent) {
        emit(Guest_RouteState(routes: event.guests, status: StatusSucess()));
      }
      if (event is Reglog_RouteEvent) {
        emit(Reglog_RouteState(routes: event.reglogs, status: StatusSucess()));
      }
    });
  }
}
