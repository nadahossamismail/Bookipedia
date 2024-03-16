part of 'verify_account_cubit.dart';

@immutable
sealed class VerifyAccountState {}

final class VerifyAccountInitial extends VerifyAccountState {}

final class VerifyAccountLoading extends VerifyAccountState {}

final class VerifyAccountFaliure extends VerifyAccountState {
  final String message;
  VerifyAccountFaliure(this.message);
}

final class VerifyAccountCompleted extends VerifyAccountState {}
