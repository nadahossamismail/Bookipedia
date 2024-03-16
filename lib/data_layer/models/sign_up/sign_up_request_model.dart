import 'dart:convert';

String signUpRequestToJson(SignUpRequestBody data) =>
    json.encode(data.toJson());

class SignUpRequestBody {
  final String name;
  final String password;
  final String passwordConfirm;
  final String email;

  SignUpRequestBody({
    required this.name,
    required this.password,
    required this.passwordConfirm,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "passwordConfirm": passwordConfirm,
        "email": email,
      };
}
