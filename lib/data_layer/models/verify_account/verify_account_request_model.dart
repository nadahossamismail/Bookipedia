import 'dart:convert';

String verifyAccountRequestModelToJson(VerifyAccountRequestBody data) =>
    json.encode(data.toJson());

class VerifyAccountRequestBody {
  final String otp;

  VerifyAccountRequestBody({
    required this.otp,
  });

  Map<String, dynamic> toJson() => {
        "otp": otp,
      };
}
