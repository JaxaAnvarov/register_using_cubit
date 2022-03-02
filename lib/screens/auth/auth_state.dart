part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthValidateState extends AuthState {
  final bool isAuthFail;
  AuthValidateState(this.isAuthFail);
}

class AuthCompleted extends AuthState {}
