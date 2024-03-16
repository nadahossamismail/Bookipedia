part of 'resend_verification_cubit.dart';

@immutable
sealed class ResendVerificationState {}

final class ResendVerificationInitial extends ResendVerificationState {}

final class ResendVerificationLoading extends ResendVerificationState {}

final class ResendVerificationFailure extends ResendVerificationState {}

final class ResendVerificationCompleted extends ResendVerificationState {}
