class LoginState {
  final String username;
  bool get isValidUserName => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  LoginState({
    this.username = '',
    this.password = '',
  });

  LoginState copyWith({
    String? username,
    String? password,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
