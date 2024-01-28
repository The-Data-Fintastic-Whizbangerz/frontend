part of 'auth_bloc.dart';

class AuthState {
  final String username;
  final String password;
  final Status status;

  AuthState(
      {this.username = '',
      this.password = '',
      this.status = const StatusInitial()});

  AuthState copyWith({
    String? username,
    String? password,
    Status? status,
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  bool get isValidUsername {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z].+");
    return emailRegExp.hasMatch(username);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~])");
    return passwordRegExp.hasMatch(password);
  }
}

class Init_AuthState extends AuthState {}

class Load_AuthState extends AuthState {
  bool isAuthenticated;

  Load_AuthState({
    required this.isAuthenticated,
  });

  @override
  // TODO: implement status
  Status get status => StatusAuthenticated();
}
