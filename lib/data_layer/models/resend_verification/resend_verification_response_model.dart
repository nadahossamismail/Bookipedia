import 'package:bookipedia/app/app_strings.dart';

ResendVerificationResponse resendVerificationResponseFromJson(
        Map<String, dynamic> json) =>
    ResendVerificationResponse.fromJson(json);

class ResendVerificationResponse {
  final String status;
  final String message;

  ResendVerificationResponse({
    required this.status,
    required this.message,
  });
  factory ResendVerificationResponse.empty({required message}) =>
      ResendVerificationResponse(status: AppStrings.failure, message: message);

  factory ResendVerificationResponse.fromJson(Map<String, dynamic> json) =>
      ResendVerificationResponse(
        status: json["status"],
        message: json["message"],
      );
}
