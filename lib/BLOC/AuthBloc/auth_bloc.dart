import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myShop/DATA/repository/authRepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState(status: "unknown"));

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthUserChanged) {
      AuthenticationRepository authRepo = AuthenticationRepository();
      String authStatus = await authRepo.googleAuth();
      print('Done With The Authentication');
      print(authStatus);
      yield AuthState(status: authStatus);
    }
    if (event is AuthLogoutRequested) {
      AuthenticationRepository _authRepo = AuthenticationRepository();
      _authRepo.logout();
      yield AuthState(status: "unknown");
    }
  }
}
