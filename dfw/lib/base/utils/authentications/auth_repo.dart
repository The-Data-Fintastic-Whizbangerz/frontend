import '../../models/user.dart';

const String SHARED_LOGGED = "USER_IS_LOGGED";
const String SHARED_USER = "USER";
const String SHARED_PASSWORD = "PASSWORD";

class AuthRepository {
  AuthRepository._();
  static final AuthRepository instance = AuthRepository._();

  Future<void> saveUser(User user) async {}

  // Future<User> getUser() async {
  // }
}
