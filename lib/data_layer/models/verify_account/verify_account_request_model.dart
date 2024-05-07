class VerifyAccountRequestBody {
  final String otp;

  VerifyAccountRequestBody({
    required this.otp,
  });

  Map<String, dynamic> toJson() => {
        "otp": otp,
      };
}
