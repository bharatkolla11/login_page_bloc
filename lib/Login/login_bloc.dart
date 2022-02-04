import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/Login/login_event.dart';
import 'package:login_page_bloc/Login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on(_userNameChanged);
    on(_passwordChanged);
  }

  void _userNameChanged(UserNameChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(username: event.username));
  }

  void _passwordChanged(PassWordChanged event, Emitter emit) async {
    emit(state.copyWith(password: event.password));
  }

  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   if (event is UserNameChanged) {
  //     yield state.copyWith(username: event.username);
  //   } else if (event is PassWordChanged) {
  //     yield state.copyWith(password: event.password);
  //   }
  // }
}
