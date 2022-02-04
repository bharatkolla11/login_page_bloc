import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/Login/login_bloc.dart';
import 'package:login_page_bloc/Login/login_event.dart';
import 'package:login_page_bloc/Login/login_state.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userNameField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        ));
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(Icons.security),
          hintText: 'Password',
        ),
        validator: (value) =>
            state.isValidPassword ? null : 'Password is not valid',
        onChanged: (value) => context.read<LoginBloc>().add(
              PassWordChanged(password: value),
            ),
      );
    });
  }

  Widget _userNameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: false,
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Username',
        ),
        validator: (value) =>
            state.isValidUserName ? null : 'Username is not valid',
        onChanged: (value) =>
            context.read<LoginBloc>().add(UserNameChanged(username: value)),
      );
    });
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: const Text('Login'),
    );
  }
}
