part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

final class LoginToVerify extends LoginState {
  final String userEmail;
  LoginToVerify(this.userEmail);
}

final class LoginCompleted extends LoginState {}
