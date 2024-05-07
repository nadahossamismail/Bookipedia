import 'dart:convert';

String resetPasswordRequestBodyToJson(ResetPasswordRequestBody data) =>
    json.encode(data.toJson());

class ResetPasswordRequestBody {
  final String otp;
  final String password;
  final String passwordConfirm;

  ResetPasswordRequestBody({
    required this.otp,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "password": password,
        "passwordConfirm": passwordConfirm,
      };
}
