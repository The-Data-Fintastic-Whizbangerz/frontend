part of 'auth_bloc.dart';

abstract class AuthEvent {}

class Init_AuthEvent extends AuthEvent {}

class Username_AuthEvent extends AuthEvent {
  final String username;
  Username_AuthEvent({required this.username});
}

class Password_AuthEvent extends AuthEvent {
  final String password;
  Password_AuthEvent({required this.password});
}

class Submit_AuthEvent extends AuthEvent {
  final String username;
  final String password;

  Submit_AuthEvent({required this.username, required this.password});
}

class Verify_AuthEvent extends AuthEvent {}

class Unknown_AuthEvent extends AuthEvent {}
