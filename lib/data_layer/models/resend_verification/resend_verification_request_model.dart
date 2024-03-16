import 'dart:convert';

String resendVerificationRequestBodyToJson(
        ResendVerificationRequestBody data) =>
    json.encode(data.toJson());

class ResendVerificationRequestBody {
  final String email;

  ResendVerificationRequestBody({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
