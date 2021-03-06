part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.status});
  final String status;

  @override
  List<Object> get props => [status];
}
