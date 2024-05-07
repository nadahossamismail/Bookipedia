import 'package:bookipedia/app/app_strings.dart';

SignUpResponse signUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse.fromJson(json);

class SignUpResponse {
  final String status;
  final String message;

  SignUpResponse({
    required this.status,
    required this.message,
  });

  factory SignUpResponse.empty(message) => SignUpResponse(
        status: AppStrings.failure,
        message: message,
      );

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        message: json["message"],
      );
}
