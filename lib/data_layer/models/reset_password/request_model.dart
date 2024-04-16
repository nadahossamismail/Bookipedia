import 'dart:convert';

String resetPasswordRequestBodyDartToJson(ResetPasswordRequestBodyDart data) =>
    json.encode(data.toJson());

class ResetPasswordRequestBodyDart {
  final String otp;
  final String password;
  final String passwordConfirm;

  ResetPasswordRequestBodyDart({
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
