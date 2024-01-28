import 'dart:convert';

class User {
  final String uuid;
  final String username;
  final String password;

  const User(
      {required this.uuid, required this.username, required this.password});

  static const empty = User(uuid: '-', username: '', password: '');

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'username': username,
      'password': password,
    };
  }

  User copyWith({
    String? uuid,
    String? username,
    String? password,
  }) {
    return User(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uuid: map['uuid'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
