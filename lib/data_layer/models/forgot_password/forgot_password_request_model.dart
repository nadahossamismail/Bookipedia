import 'dart:convert';

String forgotPasswordRequestBodyToJson(ForgotPasswordRequestBody data) =>
    json.encode(data.toJson());

class ForgotPasswordRequestBody {
  final String email;

  ForgotPasswordRequestBody({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
