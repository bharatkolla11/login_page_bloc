abstract class LoginEvent {}

class UserNameChanged extends LoginEvent {
  final String? username;

  UserNameChanged({this.username});
}

class PassWordChanged extends LoginEvent {
  final String? password;

  PassWordChanged({this.password});
}

class LoginClicked extends LoginEvent {}
