part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChanged extends AuthEvent {
  const AuthUserChanged();
  @override
  List<Object> get props => [];
}

class AuthUserFailed extends AuthEvent {
  const AuthUserFailed();
  @override
  List<Object> get props => [];
}

class AuthLogoutRequested extends AuthEvent {}
