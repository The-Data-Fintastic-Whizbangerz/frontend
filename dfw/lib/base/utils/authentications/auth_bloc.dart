import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Init_AuthState()) {
    on<AuthEvent>((event, emit) async {
      if (event is Init_AuthEvent) {}
      if (event is Username_AuthEvent) {
        emit(state.copyWith(
          username: event.username,
        ));
      }
      if (event is Password_AuthEvent) {
        emit(state.copyWith(
          password: event.password,
        ));
      }
      // CAREFUL NOT FINISHED
      if (event is Submit_AuthEvent) {
        try {
          // emit(state.copyWith(status: StatusSucess()));
          // emit(state.copyWith(status: StatusAuthenticated()));
          emit(Load_AuthState(isAuthenticated: true));
        } catch (e) {
          emit(state.copyWith(status: StatusFailed(e: e)));
        }
      }
      if (event is Verify_AuthEvent) {
        emit(state.copyWith(status: StatusAuthenticated()));
      }
      if (event is Unknown_AuthEvent) {
        emit(state.copyWith(status: StatusUnauthenticated()));
      }
    });
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) => json['value'];

  @override
  Map<String, dynamic> toJson(int state) => {'value': state};
}

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthState());
//   @override
//   Stream<AuthState> mapEventToState(AuthEvent event) async* {
//     // if (event is Init_AuthEvent) {}
//     if (event is Username_AuthEvent) {
//       yield state.copyWith(
//         username: event.username,
//       );
//     }
//     if (event is Password_AuthEvent) {
//       yield state.copyWith(
//         password: event.password,
//       );
//     }
//     // CAREFUL NOT FINISHED
//     if (event is Submit_AuthEvent) {
//       try {
//         yield state.copyWith(status: StatusSucess());
//         yield state.copyWith(status: StatusAuthenticated());
//       } catch (e) {
//         yield state.copyWith(status: StatusFailed(e: e));
//       }
//     }
//     if (event is Verify_AuthEvent) {
//       yield state.copyWith(status: StatusAuthenticated());
//     }
//     if (event is Unknown_AuthEvent) {
//       yield state.copyWith(status: StatusUnauthenticated());
//     }
//   }
// }
