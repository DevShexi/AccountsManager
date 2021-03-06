import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:myShop/DATA/repository/authRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());
  AuthenticationRepository authRepo = AuthenticationRepository();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(event.email)) {
        yield state.copyWith(email: event.email, emailError: "");
      } else {
        yield state.copyWith(
            email: event.email,
            emailError: "Please Ente a valid email address");
      }
    } else if (event is PasswordChanged) {
      if (event.password.length < 6) {
        yield state.copyWith(
            password: event.password,
            passwordError: "Password must be atleast 6 characters long");
      } else {
        yield state.copyWith(
          password: event.password,
          passwordError: "",
        );
      }
    } else if (event is AttemptLogin) {
      if (state.email != null &&
          state.password != null &&
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(state.email) &&
          state.password.length >= 2) {
        print('Login in Progress yielded');
        try {
          print("Email: ${state.email}, Password: ${state.password}");
          Map<String, dynamic> map =
              await authRepo.loginUser(state.email, state.password);
          if (map != null) {
            if (map.containsKey("username") && map.containsKey("password")) {
              yield state.copyWith(
                  email: null,
                  emailError: map["username"][0],
                  password: null,
                  passwordError: map["password"][0]);
            } else if (map.containsKey("Username")) {
              yield state.copyWith(
                  email: null,
                  emailError: map["Username"][0],
                  password: null,
                  passwordError: "");
            } else if (map.containsKey("User")) {
              yield state.copyWith(
                  email: null,
                  emailError: map["User"][0],
                  password: null,
                  passwordError: "");
            } else if (map["status"]) {
              yield LoginSuccess();
            }
          }
        } catch (e) {
          print('Exception Caught at AttemptLogin Event: $e');
        }
      } else
        yield state.copyWith(
            email: null,
            emailError: "Please Ente a valid email address",
            password: null,
            passwordError: "Password must be atleast 6 characters long");
    }
  }
}
