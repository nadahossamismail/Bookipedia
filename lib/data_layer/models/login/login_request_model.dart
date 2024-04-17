import 'dart:convert';

String loginRequestBodyToJson(LoginRequestBody data) =>
    json.encode(data.toJson());

class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
